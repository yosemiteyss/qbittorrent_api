/// {@template api_client}
/// An abstract interface for making HTTP requests.
/// {@endtemplate}
abstract interface class ApiClient {
  /// Base URL of the API.
  String get baseUrl;

  /// GET request.
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool returnBytes,
  });

  /// POST request
  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? params,
    Object? body,
    Map<String, String>? headers,
    Map<String, dynamic>? formData,
    bool returnBytes,
  });

  /// Clear cookies.
  Future<void> clearCookies();
}
