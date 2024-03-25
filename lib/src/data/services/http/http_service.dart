import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/src/data/services/http/interface/http_interface.dart';

class HttpService implements IHttpService {
  final Dio dio = Dio(BaseOptions(connectTimeout: Durations.extralong4));

  HttpService();

  @override
  Future get(String url) async {
    return await dio.get(url);
  }

  @override
  Future post(String url, {String? data}) async {
    return await dio.post(url, data: data);
  }

  @override
  Future put(String url, {String? data}) async {
    return await dio.put(url, data: data);
  }

  @override
  Future delete(String url, {String? data}) async {
    return await dio.delete(url, data: data);
  }
}
