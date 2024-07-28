import 'package:flutter/material.dart';

@immutable
class UserLogInRequest {
  const UserLogInRequest({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}