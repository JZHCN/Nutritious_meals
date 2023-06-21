import 'dart:convert';

import 'package:dio/dio.dart';

Dio initDio() {
  BaseOptions baseOptions = BaseOptions(
    // baseUrl: "http://localhost:8889",
    baseUrl: "http://192.168.43.72:8889",
    // connectTimeout: const Duration(seconds: 5),
    // receiveTimeout: const Duration(seconds: 3),
  );

  Dio dio = Dio(baseOptions);

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    // print("请求拦截${options}");
    return handler.next(options);
  }, onResponse: (response, handler) {
    return handler.next(response);
  }, onError: (DioError e, hander) {
    // print("错误拦截");
    return hander.next(e);
  }));

  return dio;
}
