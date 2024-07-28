import 'package:dio/dio.dart';
import 'package:lanars_test/data/source/remote/api/network_service.dart';

class FeedNetworkService extends NetworkService {
  FeedNetworkService({
    required String baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
      ),
    );
    if (interceptors != null) {
      _dio.interceptors.addAll(
        [
          ...interceptors,
        ],
      );
    }
  }

  late Dio _dio;

  @override
  Dio get dio => _dio;
}
