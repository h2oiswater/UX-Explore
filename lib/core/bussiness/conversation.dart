import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:starter/core/api/base/option.dart';
import 'package:starter/core/api/df_api.dart';

import 'interfaces/IConversationRepository.dart';

class ConversationRepository extends IConversationRepository {
  ConversationRepository(DFAPI dfAPI) : super(dfAPI);

  Future<Response<Map<String, dynamic>>> intentDetect(String text,
      {String sessionPath}) {
    Map<String, dynamic> params = HashMap();
    params['text'] = text;
    if (sessionPath != null) {
      params['sessionPath'] = sessionPath;
    }
    return dfAPI.request(RequestOption(
        url: '/df/', method: HttpMethod.GET, queryParams: params));
  }

  @override
  Future<Response<Map<String, dynamic>>> convertAudio2Text(String filePath) {
    return dfAPI.request(RequestOption(
        url: '/converter/m4a',
        method: HttpMethod.POST,
        fileParams: [File(filePath)]));
  }

  @override
  Future<dynamic> text2audio(String text) {
    return dfAPI.request(RequestOption(
        url: '/converter/text2audio',
        method: HttpMethod.DOWNLOAD,
        queryParams: {"text": text}));
  }

}
