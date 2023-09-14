abstract interface class ApiClient {
  String get baseUrl;

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  });

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? params,
    Object? body,
    Map<String, String>? headers,
    Map<String, dynamic>? formData,
  });

  Future<void> clearCookies();
}
