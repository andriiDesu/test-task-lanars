import 'package:get_it/get_it.dart';
import 'package:lanars_test/core/di/component/network_service_component.dart';
import 'package:lanars_test/data/repository/authorization_repository.dart';
import 'package:lanars_test/data/repository/feed_repository.dart';
import 'package:lanars_test/data/source/remote/api/authorization_api/authorization_api.dart';
import 'package:lanars_test/data/source/remote/api/feed_api/feed_api.dart';

T get<T extends Object>() => GetIt.I<T>();

Future<void> setupDI() async {
  GetIt.I
    ..registerSingleton(createAuthorizationNetworkService())
    ..registerSingleton(createFeedNetworkService())
    ..registerFactory(() => AuthorizationApi(get()))
    ..registerFactory(() => FeedApi(get()))
    ..registerFactory(() => AuthorizationRepository(get()))
    ..registerFactory(() => FeedRepository(get()));
}
