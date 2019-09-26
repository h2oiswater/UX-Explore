import 'dart:io';

import "package:path_provider/path_provider.dart";

class FileManager {
  static Future<String> getAudioPath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    Directory voiceDir = Directory("$appDocPath/voice/");
    bool isVoiceDirExist = await voiceDir.exists();
    if (!isVoiceDirExist) {
      await voiceDir.create();
    }
    return "${voiceDir.path}${DateTime.now().millisecondsSinceEpoch.toString()}.m4a";
  }

  static Future<String> getText2AudioPath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    Directory voiceDir = Directory("$appDocPath/text2audio/");
    bool isVoiceDirExist = await voiceDir.exists();
    if (!isVoiceDirExist) {
      await voiceDir.create();
    }
    return "${voiceDir.path}${DateTime.now().millisecondsSinceEpoch.toString()}.mp3";
  }
}
