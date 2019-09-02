import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class ConversationBloc with ChangeNotifier {
  final FlutterSound _recorder = new FlutterSound();

  void startRecord() async {
    Future<String> result = await _recorder.startRecorder(null);

    result.then(path) {
      print('startRecorder: $path');

      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        DateTime date = new DateTime.fromMillisecondsSinceEpoch(e.currentPosition.toInt());
        String txt = DateFormat('mm:ss:SS', 'en_US').format(date);
      });
  }
}
