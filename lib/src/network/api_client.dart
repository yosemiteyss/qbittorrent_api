abstract interface class ApiClient {
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? params,
  });

  Future<Map<String, dynamic>> post(
    String path, {
    required Object data,
  });
}
