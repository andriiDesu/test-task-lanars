import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lanars_test/data/source/remote/network_errors.dart';

class NetworkService {
  NetworkService({
    int? connectTimeout,
    int? receiveTimeout,
    int? sendTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  });

  @protected
  late Dio dio;

  Future<T> request<T>(
    String path,
    HttpMethod method, {
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required T Function(Response<dynamic>) onParse,
  }) async {
    try {
      final options = Options(method: method.name.toUpperCase());
      if (headers != null) options.headers?.addAll(headers);

      final response = await dio.request<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return onParse(response);
    } on DioException catch (e) {
      return Future.error(NetworkError.create(e));
    } catch (e) {
      return Future.error(e);
    }
  }
}

enum HttpMethod { get, put, post, delete }
