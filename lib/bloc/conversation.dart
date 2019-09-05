import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:starter/bloc/interfaces/conversation.dart';
import 'package:starter/core/bussiness/conversation.dart';
import 'package:starter/utils/file_manager.dart';

class ConversationBloc with ChangeNotifier implements IConversationBloc {
  final FlutterSound _flutterSound = new FlutterSound();
  StreamSubscription _recorderSubscription;
  StreamSubscription _playerSubscription;
  String _currentRecordingFilePath;

  bool get isRecording => _flutterSound.isRecording;
  String currentText = 'Hello';

  @override
  void dispose() {
    _flutterSound.stopPlayer();
    _flutterSound.stopRecorder();
    super.dispose();
  }

  void _playSoundCompleted() {
    currentText = 'Hello';
    notifyListeners();
  }

  void _recordCompleted() {
    currentText = 'Hello';
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
    final rep = await ConversationRepository.convertAudio2Text(
        file.path);
    print(rep);
  }
}
