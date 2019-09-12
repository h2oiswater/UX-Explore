import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:starter/bloc/interfaces/conversation.dart';
import 'package:starter/bloc/interfaces/trip.dart';
import 'package:starter/core/bussiness/conversation.dart';
import 'package:starter/model/msg.dart';

class ConversationBloc with ChangeNotifier implements IConversationBloc {
  ITripBloc tripBloc;
  // Recorder and Player
  final FlutterSound _flutterSound = new FlutterSound();

  // Recorder status listener
  StreamSubscription _recorderSubscription;

  // Player status listener
  StreamSubscription _playerSubscription;

  // Latest record file store path.
  String _currentRecordingFilePath;

  // Dialog SessionPath
  String _sessionPath;

  bool get isRecording => _flutterSound.isRecording;

  String currentText = '';

  List<Msg> conversationList = [
    Msg(
        content: '你好:)\n我是您的购票小助手，您可以对我说："我想买一张明天下午三点从昆明出发去大理的票。"\n即可完成购票。',
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        direction: MsgDirection.IN),
    Msg(
        content: '👋',
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        direction: MsgDirection.OUT),
  ];

  ConversationBloc({this.tripBloc});

  @override
  void dispose() {
    _flutterSound.stopPlayer();
    _flutterSound.stopRecorder();
    super.dispose();
  }

  void _playSoundCompleted() {
    currentText = '';
    notifyListeners();
  }

  void _recordCompleted() {
    currentText = '';
    notifyListeners();
  }

  @override
  void startRecord() async {
    print("startRecord");

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
    currentText = 'Hello';
    notifyListeners();

    getLatestText();
  }

  @override
  void startPlayer() async {
    print("startPlayer");

    if (_flutterSound.isPlaying) return;

    _currentRecordingFilePath = await _flutterSound.startPlayer(null);

    print('startPlayer: $_currentRecordingFilePath');

    _playerSubscription = _flutterSound.onPlayerStateChanged.listen((e) {
      if (e != null) {
        if (e.currentPosition == e.duration) {
          _playSoundCompleted();
        }
      }
    });
    currentText = '正在播放';
    notifyListeners();
  }

  @override
  void stopPlayer() async {
    print("stopPlayer");

    if (!_flutterSound.isPlaying) {
      _playSoundCompleted();
      return;
    }

    String value;
    try {
      value = await _flutterSound.stopPlayer();
    } catch (e) {
      print('--- stopPlayer error ---');
      print(e.toString());
      print('--- stopPlayer end ---');
    }

    print('stopRecorder: $value');

    if (_playerSubscription != null) {
      _playerSubscription.cancel();
      _playerSubscription = null;
    }
    _recordCompleted();
  }

  @override
  void getLatestText() async {
    final file = File.fromUri(Uri.parse(_currentRecordingFilePath));
    print('getLatestText');
    final rep = await ConversationRepository.convertAudio2Text(file.path);
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
    final rep = await ConversationRepository.intentDetect(text,
        sessionPath: _sessionPath);

    print(rep.toString());

    _sessionPath = rep.data['sessionPath'];
    _addMsg(Msg(
        content: rep.data['fulfillmentText'],
        direction: MsgDirection.IN,
        id: DateTime.now().millisecondsSinceEpoch.toString()));
  }

  void _addMsg(Msg msg) {
    conversationList.add(msg);
    notifyListeners();
  }
}
