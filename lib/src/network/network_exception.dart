import 'package:dio/dio.dart';

class NetworkException implements Exception {
  NetworkException({required this.type, required this.message});

  final NetworkExceptionType type;
  final String? message;

  @override
  String toString() {
    return 'NetworkException{type: $type, message: $message}';
  }
}

enum NetworkExceptionType {
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badCertificate,
  badResponse,
  cancel,
  connectionError,
  unknown;

  static NetworkExceptionType fromDioExceptionType(DioExceptionType type) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return NetworkExceptionType.connectionTimeout;
      case DioExceptionType.sendTimeout:
        return NetworkExceptionType.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return NetworkExceptionType.receiveTimeout;
      case DioExceptionType.badCertificate:
        return NetworkExceptionType.badCertificate;
      case DioExceptionType.badResponse:
        return NetworkExceptionType.badResponse;
      case DioExceptionType.cancel:
        return NetworkExceptionType.cancel;
      case DioExceptionType.connectionError:
        return NetworkExceptionType.connectionError;
      case DioExceptionType.unknown:
        return NetworkExceptionType.unknown;
    }
  }
}
