import 'package:dio/dio.dart';

mixin ApiMethod {
  
  final dio = Dio();
  void initialDio({Map<String, dynamic>? headers}) {
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (status) => true,
      receiveDataWhenStatusError: true,
    );
  }

  Future<Response> postMethod({
    required String url,
    required dynamic body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (headers != null) {
      dio.options.headers = headers;
    }
    Response response = await dio.post(
      url,
      data: body,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response> getMethod({
    required String url,
  }) async {
    Response response = await dio.get(
      url,
    );
    return response;
  }
}
