import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:qbittorrent_api/qbittorrent_api.dart';
import 'package:qbittorrent_api/src/network/api_client.dart';
import 'package:qbittorrent_api/src/network/dio_logging_interceptor.dart';

class DioClient implements ApiClient {
  DioClient({
    required this.baseUrl,
    required this.cookiePath,
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

    if (cookiePath != null) {
      _persistCookieJar = PersistCookieJar(
        ignoreExpires: true,
        storage: FileStorage('$cookiePath/.cookies/'),
      );
      _dio.interceptors.add(
        CookieManager(_persistCookieJar!),
      );
    }

    if (logger) {
      _dio.interceptors.add(
        DioLoggingInterceptor(level: Level.body),
      );
    }
  }

  late final Dio _dio;
  PersistCookieJar? _persistCookieJar;

  @override
  final String baseUrl;
  final String? cookiePath;

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool returnBytes = false,
  }) {
    params?.removeWhere((key, value) => value == null);
    return _exceptionHandler(() async {
      final response = await _dio.get<dynamic>(
        baseUrl + path,
        queryParameters: params,
        options: Options(
          headers: headers,
          contentType: Headers.formUrlEncodedContentType,
          responseType: returnBytes ? ResponseType.bytes : ResponseType.plain,
        ),
      );
      return _convertDataFormat(response);
    });
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? params,
    Object? body,
    Map<String, String>? headers,
    Map<String, dynamic>? formData,
    bool returnBytes = false,
  }) async {
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

    params?.removeWhere((key, value) => value == null);

    return _exceptionHandler(() async {
      final response = await _dio.post<dynamic>(
        baseUrl + path,
        queryParameters: params,
        data: requestData,
        options: Options(
          headers: headers,
          contentType: Headers.formUrlEncodedContentType,
          responseType: returnBytes ? ResponseType.bytes : ResponseType.plain,
        ),
      );
      return _convertDataFormat(response);
    });
  }

  @override
  Future<void> clearCookies() async {
    await _persistCookieJar?.deleteAll();
  }

  dynamic _convertDataFormat(Response<dynamic> response) {
    final headers = response.headers[Headers.contentTypeHeader];
    final contentType = headers?.first.split(';').first;

    if (contentType == Headers.jsonContentType) {
      return jsonDecode(response.data);
    }

    if (response.data is List<int>) {
      return response.data as Uint8List;
    }

    return response.data as String?;
  }

  Future<dynamic> _exceptionHandler(
    Future<dynamic> Function() callback,
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
        message: 'Unknown error: ${e.toString()}',
      );
    }
  }
}

extension FileExtensions on File {
  Future<MultipartFile> toMultipartFile() {
    return MultipartFile.fromFile(
      path,
      filename: basename(path),
      contentType: MediaType('application', 'x-bittorrent'),
    );
  }
}

extension BytesFileExtensions on FileBytes {
  MultipartFile toMultipartFile() {
    return MultipartFile.fromBytes(
      bytes,
      filename: filename,
      contentType: MediaType('application', 'x-bittorrent'),
    );
  }
}
