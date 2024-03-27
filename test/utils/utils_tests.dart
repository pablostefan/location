import 'dart:convert';

import 'package:dio/src/options.dart';
import 'package:dio/src/response.dart';

class UtilsTests {
  static Response response({required dynamic json, required String methodType}) {
    return Response(
      data: jsonDecode(json),
      requestOptions: RequestOptions(method: methodType, path: "http://ip-api.com/json"),
    );
  }
}
