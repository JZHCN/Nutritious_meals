import 'dart:convert';
import 'package:dio/dio.dart';
import 'init_dio.dart';

class Request {
  Future request(String path, Map<String, dynamic> data, String method) async {
    Response res = await initDio().request(path,
        options: Options(method: method), data: data, queryParameters: data);
    final jsonData = jsonDecode(res.toString());
    return jsonData;
  }

  Future get(String path, {Map<String, dynamic> data = const {}}) {
    return request(path, data, "get");
  }

  Future post(String path, {Map<String, dynamic> data = const {}}) {
    return request(path, data, "post");
  }

  Future put(String path, {Map<String, dynamic> data = const {}}) {
    return request(path, data, "put");
  }

  Future delete(String path, {Map<String, dynamic> data = const {}}) {
    return request(path, data, "delete");
  }
}
