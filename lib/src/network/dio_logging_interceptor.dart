import 'dart:convert';

import 'package:dio/dio.dart';

/// {@template logging_level}
/// Defines the level of logging for HTTP requests and responses.
/// {@endtemplate}
enum LoggingLevel {
  /// No logs.
  none,

  /// Logs request and response lines.
  basic,

  /// Logs request and response lines and their respective headers.
  headers,

  /// Logs request and response lines and their respective headers and bodies.
  body,
}

/// {@template http_logging_interceptor}
/// A dio interceptor that logs HTTP requests and responses.
/// {@endtemplate}
class DioLoggingInterceptor extends Interceptor {
  /// {@macro http_logging_interceptor}
  DioLoggingInterceptor({
    required this.tag,
    this.level = LoggingLevel.none,
    this.compact = true,
    this.logPrint = print,
  });

  /// Starting tag for each log line.
  final String tag;

  /// Log Level
  final LoggingLevel level;

  /// Log printer; defaults logPrint log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file.
  void Function(Object object) logPrint;

  /// Print compact json response
  final bool compact;

  final JsonEncoder _jsonEncoder = const JsonEncoder.withIndent('  ');

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (level == LoggingLevel.none) {
      return handler.next(options);
    }

    logPrint('[$tag] --> ${options.method} ${options.uri}');

    if (level == LoggingLevel.basic) {
      return handler.next(options);
    }

    if (options.headers.isNotEmpty) {
      logPrint('[$tag] Headers:');
    }

    options.headers.forEach((key, value) {
      logPrint('[$tag] $key:$value');
    });

    if (level == LoggingLevel.headers) {
      logPrint('[$tag] --> END ${options.method}');
      return handler.next(options);
    }

    final data = options.data;
    if (data != null) {
      if (data is Map) {
        if (compact) {
          logPrint('[$tag] Data:');
          logPrint('[$tag] $data');
        } else {
          _prettyPrintJson(data);
        }
      } else if (data is FormData) {
        // NOT IMPLEMENT
        logPrint('[$tag] Form Data:');
        logPrint('[$tag] ----------------------------');
      } else {
        logPrint('[$tag] Data:');
        logPrint('[$tag] $data');
      }
    }

    logPrint('[$tag] --> END ${options.method}');

    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (level == LoggingLevel.none) {
      return handler.next(response);
    }

    logPrint(
        '[$tag] <-- ${response.statusCode} ${(response.statusMessage?.isNotEmpty ?? false) ? response.statusMessage : ''}');

    if (level == LoggingLevel.basic) {
      return handler.next(response);
    }

    if (!response.headers.isEmpty) {
      logPrint('[$tag] Headers:');
    }

    response.headers.forEach((key, value) {
      logPrint('[$tag] $key:$value');
    });

    if (level == LoggingLevel.headers) {
      logPrint('[$tag] --> END HTTP');
      return handler.next(response);
    }

    final data = response.data;
    if (data != null) {
      logPrint('[$tag] Data:');
      if (data is Map) {
        if (compact) {
          logPrint('[$tag] $data');
        } else {
          _prettyPrintJson(data);
        }
      } else if (data is List) {
        // NOT IMPLEMENT
      } else {
        logPrint('[$tag] $data');
      }
    }

    logPrint('[$tag] <-- END HTTP');
    return handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (level == LoggingLevel.none) {
      return handler.next(err);
    }

    logPrint('[$tag] <-- HTTP FAILED: $err');

    return handler.next(err);
  }

  void _prettyPrintJson(Object input) {
    final prettyString = _jsonEncoder.convert(input);
    prettyString.split('\n').forEach((element) => logPrint('[$tag] $element'));
  }
}
