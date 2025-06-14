import 'dart:io';

import 'package:equatable/equatable.dart';

/// {@template cookies_strategy}
/// Strategy for managing cookies.
/// {@endtemplate}
sealed class CookiesStrategy extends Equatable {
  /// {@macro cookies_strategy}
  const CookiesStrategy();

  @override
  List<Object?> get props => [];
}

/// {@template in_memory_cookies_strategy}
/// Strategy for managing cookies in memory.
/// {@endtemplate}
final class InMemoryCookiesStrategy extends CookiesStrategy {
  /// {@macro in_memory_cookies_strategy}
  const InMemoryCookiesStrategy();
}

/// {@template disk_cookies_strategy}
/// Strategy for managing cookies that are persisted to a file.
/// {@endtemplate}
final class DiskCookiesStrategy extends CookiesStrategy {
  /// {@macro disk_cookies_strategy}
  const DiskCookiesStrategy({
    required this.directory,
  });

  /// The directory where cookies will be stored.
  final String directory;

  /// The normalized directory with a trailing slash.
  String get normalizedDirectory => directory.endsWith(Platform.pathSeparator)
      ? directory
      : '$directory${Platform.pathSeparator}';

  @override
  List<Object?> get props => [directory];
}

/// {@template no_cookies_strategy}
/// Strategy for not managing cookies, used for Flutter web.
/// {@endtemplate}
final class WebCookiesStrategy extends CookiesStrategy {
  /// {@macro web_cookies_strategy}
  const WebCookiesStrategy();

  @override
  List<Object?> get props => [];
}
