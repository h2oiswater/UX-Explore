import 'dart:io';
import 'package:dio/dio.dart';
import 'package:starter/core/api/config.dart';

class HttpClient {
  // 单例公开访问点
  factory HttpClient() => _sharedInstance();

  // 静态私有成员，没有初始化
  static HttpClient _instance;

  HttpClient._() {
    // 具体初始化代码
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = BaseOptions(
      //请求基地址,可以包含子路径
//      baseUrl: BASE_URL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //Http请求头.
      headers: {
        //do something
      },
      //请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
      contentType: ContentType.json,
      //表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.plain,
    );

    dio = Dio(options);

    //Cookie管理
//    dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("请求之前");
      // Do something before request is sent
      return options; //continue
    }, onResponse: (Response response) {
      print("响应之前");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      print("错误之前");
      // Do something with response error
      return e; //continue
    }));
  }

  // 静态、同步、私有访问点
  static HttpClient _sharedInstance() {
    if (_instance == null) {
      _instance = HttpClient._();
    }
    return _instance;
  }

  Dio dio;
  BaseOptions options;
  CancelToken cancelToken = CancelToken();

  Future<dynamic> upload(String url, File file) async {
    FormData formData = new FormData.from({
      "files": new UploadFileInfo(file, 'audio.m4a'),
    });

    print(BASE_URL + url);
    dynamic response = await dio.post(BASE_URL + url, data: formData);
    return response;
  }
}
