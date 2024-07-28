import 'package:flutter/foundation.dart';
import 'package:lanars_test/data/source/remote/api/authorization_api/authorization_network_service.dart';
import 'package:lanars_test/data/source/remote/api/feed_api/feed_network_service.dart';
import 'package:lanars_test/data/source/remote/network_api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const _connectTimeout = Duration(seconds: 20);
const _receiveTimeout = Duration(seconds: 20);
const _sendTimeout = Duration(seconds: 20);

AuthorizationNetworkService createAuthorizationNetworkService() {
  return AuthorizationNetworkService(
    connectTimeout: _connectTimeout,
    receiveTimeout: _receiveTimeout,
    baseUrl: Api.authorizationEndpoint,
    sendTimeout: _sendTimeout,
    interceptors: [if (kDebugMode) _createLogger()],
  );
}

FeedNetworkService createFeedNetworkService() {
  return FeedNetworkService(
    connectTimeout: _connectTimeout,
    receiveTimeout: _receiveTimeout,
    baseUrl: Api.feedEndpoint,
    sendTimeout: _sendTimeout,
    interceptors: [if (kDebugMode) _createLogger()],
  );
}

PrettyDioLogger _createLogger() {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
  );
}
