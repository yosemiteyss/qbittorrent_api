// ignore_for_file: use_setters_to_change_properties

import 'dart:convert';

import 'package:qbittorrent_api/src/network/api_client.dart';

class FakeApiClient implements ApiClient {
  dynamic _response;
  String? _path;
  Map<String, dynamic>? _params;
  Map<String, String>? _headers;
  Map<String, dynamic>? _formData;
  Object? _body;

  @override
  String get baseUrl => 'localhost:8090/api/v2';

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) async {
    _path = path;
    _params = params;
    _headers = headers;
    return _response;
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? params,
    Object? body,
    Map<String, String>? headers,
    Map<String, dynamic>? formData,
  }) async {
    _path = path;
    _params = params;
    _body = body;
    _headers = headers;
    _formData = formData;
    return _response;
  }

  @override
  Future<void> clearCookies() async {}

  void setResponse(String response, {bool isJson = false}) {
    if (isJson) {
      _response = jsonDecode(response);
    } else {
      _response = response;
    }
  }

  String? getPath() => _path;

  Map<String, dynamic>? getParams() => _params;

  Object? getBody() => _body;

  Map<String, String>? getHeaders() => _headers;

  Map<String, dynamic>? getFormData() => _formData;
}
