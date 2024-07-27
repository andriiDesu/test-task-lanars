import 'package:flutter/material.dart';
import 'package:lanars_test/core/navigation/route_manager.dart';

@immutable
class RouteState {
  const RouteState(this.name);

  final String name;
}

class BackRouteState extends RouteState {
  const BackRouteState() : super('');
}

class LoginRouteState extends RouteState {
  const LoginRouteState() : super(loginRoute);
}
