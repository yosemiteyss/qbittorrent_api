import 'dart:async';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:qbittorrent_api/qbittorrent_api.dart';
import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/network/dio_logging_interceptor.dart';

/// {@template dio_client}
/// A client for making HTTP requests using Dio.
/// {@endtemplate}
class DioClient implements ApiClient {
  /// {@macro dio_client}
  DioClient({
    required this.baseUrl,
    required this.cookiesStrategy,
    required Duration connectTimeout,
    required Duration receiveTimeout,
    required Duration sendTimeout,
    bool logger = false,
  }) {
    _dio = Dio(
      BaseOptions(
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
      ),
    );

    final strategy = cookiesStrategy;
    if (strategy != null) {
      _cookieJar = switch (strategy) {
        InMemoryCookiesStrategy(:final ignoreExpires) => CookieJar(
            ignoreExpires: ignoreExpires,
          ),
        DiskCookiesStrategy(:final ignoreExpires, :final normalizedDirectory) =>
          PersistCookieJar(
            storage: FileStorage(normalizedDirectory),
            ignoreExpires: ignoreExpires,
          ),
        WebCookiesStrategy() => WebCookieJar(),
      };
      _dio.interceptors.add(CookieManager(_cookieJar!));
    }

    if (logger) {
      _dio.interceptors.add(
        DioLoggingInterceptor(
          tag: 'qbittorrent_api',
          level: LoggingLevel.body,
        ),
      );
    }
  }

  /// Strategy for managing cookies.
  final CookiesStrategy? cookiesStrategy;

  late final Dio _dio;
  CookieJar? _cookieJar;

  @override
  final String baseUrl;

  @override
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool returnBytes = false,
  }) {
    return _exceptionHandler(() async {
      final response = await _dio.get<T>(
        baseUrl + path,
        queryParameters: params?..removeWhere((key, value) => value == null),
        options: Options(
          headers: headers,
          contentType: Headers.formUrlEncodedContentType,
          responseType: returnBytes ? ResponseType.bytes : ResponseType.plain,
        ),
      );
      return response.data as T;
    });
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
    return _exceptionHandler(() async {
      final response = await _dio.post<T>(
        baseUrl + path,
        queryParameters: params?..removeWhere((key, value) => value == null),
        data: await _buildPostRequestData(formData, body),
        options: Options(
          headers: headers,
          contentType: Headers.formUrlEncodedContentType,
          responseType: returnBytes ? ResponseType.bytes : ResponseType.plain,
        ),
      );
      return response.data as T;
    });
  }

  @override
  Future<void> clearCookies() async {
    if (_cookieJar != null) {
      await _cookieJar?.deleteAll();
    }
  }

  Future<dynamic> _buildPostRequestData(
    Map<String, dynamic>? formData,
    Object? body,
  ) async {
    final dynamic requestData;
    if (formData != null) {
      for (final entry in formData.entries) {
        final key = entry.key;
        final value = entry.value;

        // Convert File to MultipartFile
        if (value is File) {
          formData[key] = [await value.toMultipartFile()];
          continue;
        }

        // Convert List<File> to List<MultipartFile>
        if (value is List<File>) {
          formData[key] = await Future.wait(
            value.map((file) => file.toMultipartFile()).toList(),
          );
          continue;
        }

        // Convert FileBytes to MultipartFile
        if (value is FileBytes) {
          formData[key] = [value.toMultipartFile()];
          continue;
        }

        // Convert List<FileBytes> to List<MultipartFile>
        if (value is List<FileBytes>) {
          formData[key] = value.map((file) => file.toMultipartFile()).toList();
          continue;
        }
      }
      requestData = FormData.fromMap(formData);
    } else {
      requestData = body;
    }

    return requestData;
  }

  Future<T> _exceptionHandler<T>(
    Future<T> Function() callback,
  ) async {
    try {
      return await callback();
    } on DioException catch (e) {
      throw QBittorrentException(
        statusCode: e.response?.statusCode,
        statusMessage: e.response?.statusMessage,
        message: e.message,
      );
    } on FormatException catch (e) {
      throw QBittorrentException(
        message: 'Bad json format: ${e.message}',
      );
    } catch (e) {
      throw QBittorrentException(
        message: 'Unknown error: $e',
      );
    }
  }
}

/// {@template file_extensions}
/// Extensions for [File].
/// {@endtemplate}
extension FileExtensions on File {
  /// Converts the file to a [MultipartFile].
  Future<MultipartFile> toMultipartFile() {
    return MultipartFile.fromFile(
      path,
      filename: basename(path),
      contentType: MediaType('application', 'x-bittorrent'),
    );
  }
}

/// {@template file_bytes_extensions}
/// Extensions for [FileBytes].
/// {@endtemplate}
extension BytesFileExtensions on FileBytes {
  /// Converts the file bytes to a [MultipartFile].
  MultipartFile toMultipartFile() {
    return MultipartFile.fromBytes(
      bytes,
      filename: filename,
      contentType: MediaType('application', 'x-bittorrent'),
    );
  }
}
