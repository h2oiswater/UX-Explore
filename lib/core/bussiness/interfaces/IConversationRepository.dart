import 'package:dio/dio.dart';
import 'package:starter/core/api/df_api.dart';

abstract class IConversationRepository {
  DFAPI dfAPI;
  IConversationRepository(this.dfAPI);

  Future<Response<Map<String, dynamic>>> convertAudio2Text(
      String filePath);

  Future<Response<Map<String, dynamic>>> intentDetect(String text,
      {String sessionPath});
}