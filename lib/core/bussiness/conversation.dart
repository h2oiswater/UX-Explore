import 'dart:io';

import 'package:starter/core/api/http_client.dart';

class ConversationRepository {
  static Future<dynamic> convertAudio2Text(String filePath) {
    return HttpClient().upload('/converter/m4a', File(filePath));
  }
}