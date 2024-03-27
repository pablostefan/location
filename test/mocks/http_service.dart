import 'dart:async';

import 'package:dio/dio.dart';
import 'package:location/src/data/services/http/interface/http_interface.dart';
import 'package:mockito/mockito.dart';

class MockIHttpService extends Mock implements IHttpService {
  MockIHttpService() {
    throwOnMissingStub(this);
  }

  @override
  Future<dynamic> get(String? url) {
    return super.noSuchMethod(Invocation.method(#get, [url]), returnValue: Future<dynamic>.value()) as Future<dynamic>;
  }

  @override
  Future<dynamic> post(String? url, {String? data}) {
    return super.noSuchMethod(Invocation.method(#post, [url], {#data: data}), returnValue: Future<dynamic>.value())
        as Future<dynamic>;
  }

  @override
  Future<dynamic> put(String? url, {String? data}) {
    return super.noSuchMethod(Invocation.method(#put, [url], {#data: data}), returnValue: Future<dynamic>.value())
        as Future<dynamic>;
  }

  @override
  Future<dynamic> delete(String? url, {Options? options}) {
    return super.noSuchMethod(Invocation.method(#delete, [url], {#options: options}),
        returnValue: Future<dynamic>.value()) as Future<dynamic>;
  }
}
