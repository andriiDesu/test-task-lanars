import 'package:dio/dio.dart';

class NetworkError extends Error {
  NetworkError({
    this.baseUrl,
    this.path,
    this.message,
    this.responseData,
    this.statusCode,
    this.responseHeaders,
  });

  factory NetworkError.create(DioException error) {
    final response = error.response;
    final request = error.requestOptions;
    return NetworkError(
      statusCode: response?.statusCode,
      responseHeaders: response?.headers,
      responseData: response?.data,
      baseUrl: request.baseUrl,
      path: request.path,
      message: error.message,
    );
  }

  final String? baseUrl;
  final String? path;
  final String? message;
  final dynamic responseData;
  final int? statusCode;
  final Headers? responseHeaders;

  @override
  String toString() {
    return 'NetworkError{baseUrl: $baseUrl, path: $path, message: $message, '
        'responseData: $responseData, statusCode: $statusCode, '
        'responseHeaders: $responseHeaders}';
  }
}
