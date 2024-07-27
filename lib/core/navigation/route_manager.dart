import 'package:flutter/material.dart';

const loginRoute = '/';

class RouteManager {
  RouteManager._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => Container());
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
