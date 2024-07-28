import 'package:flutter/material.dart';
import 'package:lanars_test/domain/models/user_data.dart';

@immutable
class RouteState {}

class BackRouteState extends RouteState {}

class LoginRouteState extends RouteState {}

class PictureListRouteState extends RouteState {
  PictureListRouteState(this.userData);

  final UserData userData;
}
