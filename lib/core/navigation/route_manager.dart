import 'package:flutter/material.dart';
import 'package:lanars_test/modules/feed/view/feed_screen.dart';
import 'package:lanars_test/modules/login/view/login_screen.dart';

class RouteManager {
  RouteManager._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case FeedScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const FeedScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
