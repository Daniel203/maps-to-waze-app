import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';

class AppError implements Exception {
  final String code;
  final String message;
  final int status;
  final Map<String, dynamic>? details;

  AppError({
    required this.code,
    required this.message,
    required this.status,
    this.details,
  });

  factory AppError.fromJson(Map<String, dynamic> json) {
    return AppError(
      code: json['code'] as String? ?? 'INTERNAL_ERROR',
      message: json['message'] as String? ?? 'Unknown error',
      status: json['status'] as int? ?? 500,
      details: json['details'] as Map<String, dynamic>?,
    );
  }

  @override
  String toString() => 'AppError($code): $message';
}

String describeError(Object error) {
  final log = Logger('describeError');

  if (error is AppError) {
    log.warning('Backend error: ${error.code} — ${error.message}');
    switch (error.code) {
      case 'INVALID_REQUEST':
        return 'The URL format is invalid.';
      case 'MISSING_PARAMETER':
        return "Something's missing. Please try again.";
      case 'NOT_FOUND':
        return 'No location found for this URL.';
      case 'UNPROCESSABLE':
        return "Couldn't read a location from this URL.";
      case 'RATE_LIMIT_EXCEEDED':
        return 'Daily conversion limit reached. Try again tomorrow.';
      case 'SERVER_CONFIGURATION_ERROR':
        return 'Server configuration issue. Please try again later.';
      case 'DATABASE_ERROR':
        return 'Server error. Please try again later.';
      case 'UPSTREAM_SERVICE_ERROR':
        return 'The maps service is unavailable. Try again later.';
      case 'UPSTREAM_SERVICE_TIMEOUT':
        return 'The maps service timed out. Try again.';
      case 'SERVICE_UNAVAILABLE':
        return 'Service temporarily unavailable. Try again later.';
      case 'INTERNAL_ERROR':
        return 'Something went wrong. Please try again.';
      default:
        return error.message;
    }
  }

  log.warning('Local error: $error');
  if (error is SocketException) {
    return 'No internet connection. Check your network.';
  }
  if (error is HttpException) {
    return 'Server error. Please try again later.';
  }
  if (error is TimeoutException) {
    return 'The request timed out. Check your connection.';
  }
  return 'Something went wrong. Please try again.';
}
