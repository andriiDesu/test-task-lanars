import 'package:flutter/material.dart';

@immutable
class UserName {
  const UserName({
    required this.firstName,
    required this.lastName,
  });

  final String firstName;
  final String lastName;
}