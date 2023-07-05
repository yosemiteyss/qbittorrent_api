import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/network/network_exception.dart';

class DioClient implements ApiClient {
  DioClient({required this.baseUrl});

  final String baseUrl;
  final Dio _dio = Dio();

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? params,
  }) {
    return _exceptionHandler(() async {
      final response = await _dio.get(
        baseUrl + path,
        queryParameters: params,
      );
      return json.decode(response.data);
    });
  }

  @override
  Future<Map<String, dynamic>> post(
    String path, {
    required Object data,
  }) {
    return _exceptionHandler(() async {
      final response = await _dio.post(baseUrl + path, data: data);
      return json.decode(response.data);
    });
  }

  Future<Map<String, dynamic>> _exceptionHandler(
    Future<Map<String, dynamic>> Function() callback,
  ) async {
    try {
      return await callback();
    } on DioException catch (e) {
      throw NetworkException(
        type: NetworkExceptionType.fromDioExceptionType(e.type),
        message: e.message,
      );
    } on FormatException catch (e) {
      throw NetworkException(
        type: NetworkExceptionType.badResponse,
        message: 'Bad json format: ${e.message}',
      );
    } catch (e) {
      throw NetworkException(
        type: NetworkExceptionType.unknown,
        message: 'Unknown error: ${e.toString()}',
      );
    }
  }
}
