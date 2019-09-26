import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:starter/bloc/api.dart';
import 'package:starter/bloc/interfaces/conversation.dart';
import 'package:starter/bloc/user_info.dart';
import 'package:starter/model/df/detect_intent_response/detect_intent.dart';
import 'package:starter/model/msg.dart';
import 'package:starter/model/passenger.dart';

class ConversationBloc with ChangeNotifier implements IConversationBloc {
  static const String NAME = "ConversationBloc";

  //
  AudioPlayer _audioPlayer = AudioPlayer();

  // Recorder and Player
  final FlutterSound _flutterSound = new FlutterSound();

  // Recorder status listener
  StreamSubscription _recorderSubscription;

  // Latest record file store path.
  String _currentRecordingFilePath;

  // Dialog SessionPath
  String _sessionPath;

  // current intent info
  DetectIntent _detectIntent;

  APIProvider api;

  ScrollController scrollController;

  bool get isRecording => _flutterSound.isRecording;

  String currentText = '按住说话';

  UserInfoBloc userInfoBloc;

  List<Msg> conversationList = [
    Msg(
        content: '你好:)\n我是您的购票小助手小芮，您可以对我说："我想买一张明天下午三点从昆明出发去大理的票。"\n即可完成购票。',
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        direction: MsgDirection.IN),
    Msg(
        content: '👋',
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        direction: MsgDirection.OUT)
  ];

  @override
  void dispose() {
    _flutterSound.stopPlayer();
    _flutterSound.stopRecorder();
    super.dispose();
  }

  void _recordCompleted() {
    currentText = '按住说话';
    notifyListeners();
  }

  @override
  void startRecord() async {
    print("startRecord");

    stopPlayer();

    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.microphone);

    if (_flutterSound.isRecording) return;

    try {
      _currentRecordingFilePath = await _flutterSound.startRecorder(null);
    } catch (e) {
      print('--- startRecord error ---');
      print(e.toString());
      print('--- startRecord end ---');
      return;
    }

    if (permission != PermissionStatus.granted) {
      print('Permission not granted');
      stopRecord();
      return;
    }

    print('startRecorder: $_currentRecordingFilePath');

    _recorderSubscription = _flutterSound.onRecorderStateChanged.listen((e) {
      if (e != null) {
        DateTime date =
            new DateTime.fromMillisecondsSinceEpoch(e.currentPosition.toInt());
        String txt = '${date.minute}:${date.second}:${date.millisecond}';
      }
    });
    currentText = '正在记录';
    notifyListeners();
  }

  @override
  void stopRecord() async {
    print("stopRecord");

    if (!_flutterSound.isRecording) {
      _recordCompleted();
      return;
    }

    String value;
    try {
      value = await _flutterSound.stopRecorder();
    } catch (e) {
      print('--- stopRecord error ---');
      print(e.toString());
      print('--- stopRecord end ---');
    }

    print('stopRecorder: $value');

    if (_recorderSubscription != null) {
      _recorderSubscription.cancel();
      _recorderSubscription = null;
    }

    _recordCompleted();

    getLatestText();
  }

  @override
  void startPlayer(String path) async {
    print("startPlayer");

    int result = await _audioPlayer.play(path, isLocal: true);

    print(result);
  }

  @override
  void stopPlayer() async {
    print("stopPlayer");

    int result = await _audioPlayer.stop();

    print(result);
  }

  @override
  void getLatestText() async {
    final file = File.fromUri(Uri.parse(_currentRecordingFilePath));
    print('getLatestText');
    final rep =
        await api.dfAPI.conversationRepository.convertAudio2Text(file.path);
    _addMsg(Msg(
        content: rep.data['data'],
        direction: MsgDirection.OUT,
        id: DateTime.now().millisecondsSinceEpoch.toString()));

//    Future.delayed(
//        Duration(seconds: 3),
//        () => _addMsg(Msg(
//            content: '我很好',
//            direction: MsgDirection.IN,
//            id: DateTime.now().millisecondsSinceEpoch.toString())));

    _intentDetect(rep.data['data']);
  }

  void _intentDetect(String text) async {
    final rep = await api.dfAPI.conversationRepository
        .intentDetect(text, sessionPath: _sessionPath);

    print(rep.toString());

    _sessionPath = rep.data['sessionPath'];

    _detectIntent = DetectIntent.fromJsonMap(rep.data['fullResponse']);

    var speakMessage;
    if (rep.data['fulfillmentText'] == '好的，正在为您出票') {
      speakMessage = '好的，在您选择了乘车人后，将为您出票。';
      _addMsg(Msg(
          content: speakMessage,
          direction: MsgDirection.IN,
          id: DateTime.now().millisecondsSinceEpoch.toString()));
      // 搜集了所有的信息了
      _showPassengerSelector(_detectIntent.parameters.fields.count.numberValue);
    } else {
      speakMessage = rep.data['fulfillmentText'];
      _addMsg(Msg(
          content: speakMessage,
          direction: MsgDirection.IN,
          id: DateTime.now().millisecondsSinceEpoch.toString()));
    }

    try {
      var localPath =
          await api.dfAPI.conversationRepository.text2audio(speakMessage);
      startPlayer(localPath);
    } catch (e) {
      print(e);
    }
  }

  void _addMsg(Msg msg) {
    conversationList.add(msg);

    notifyListeners();

    if (scrollController != null) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 100.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  void _showPassengerSelector(count) async {
    List<Passenger> selectedPassengers =
        await userInfoBloc.showPassengerSelector(count);
    var params = {
      "passengers": selectedPassengers.map((p) => p.id).toList(),
      "origin": _detectIntent.parameters.fields.origin.stringValue,
      "destination": _detectIntent.parameters.fields.destination.stringValue,
      "date": _detectIntent.parameters.fields.date.stringValue,
      "time": _detectIntent.parameters.fields.time.stringValue,
    };
    print(params.toString());
  }
}
