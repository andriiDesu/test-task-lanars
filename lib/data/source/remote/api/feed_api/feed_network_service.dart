import 'package:daily_extensions/daily_extensions.dart';
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
          _authInterceptor()
        ],
      );
    }
  }

  late Dio _dio;

  @override
  Dio get dio => _dio;
}

///Interceptor used for passing api key inside of a header.
QueuedInterceptorsWrapper _authInterceptor() {
  return QueuedInterceptorsWrapper(
    onRequest: (request, handler) async {
      const apiKey = String.fromEnvironment('pexels_key');

      if (!apiKey.isEmptyOrNull) {
        request.headers['Authorization'] = apiKey;
      }

      return handler.next(
        request.copyWith(),
      );
    },
  );
}
