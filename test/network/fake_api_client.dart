import 'dart:convert';

import 'package:qbittorrent_api/src/network/api_client.dart';

class FakeApiClient implements ApiClient {
  dynamic _response;
  String? _path;
  Map<String, dynamic>? _params;
  Map<String, String>? _headers;
  Map<String, dynamic>? _formData;
  dynamic _body;

  @override
  String get baseUrl => 'localhost:8090/api/v2';

  @override
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool returnBytes = false,
  }) async {
    _path = path;
    _params = params;
    _headers = headers;
    return _response as T;
  }

  @override
  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? params,
    Object? body,
    Map<String, String>? headers,
    Map<String, dynamic>? formData,
    bool returnBytes = false,
  }) async {
    _path = path;
    _params = params;
    _body = body;
    _headers = headers;
    _formData = formData;
    return _response as T;
  }

  @override
  Future<void> clearCookies() async {}

  void setResponse(dynamic response, {bool isJson = false}) {
    if (isJson) {
      _response = jsonDecode(response as String);
    } else {
      _response = response;
    }
  }

  String? getPath() => _path;

  Map<String, dynamic>? getParams() => _params;

  dynamic getBody() => _body;

  Map<String, String>? getHeaders() => _headers;

  Map<String, dynamic>? getFormData() => _formData;
}
