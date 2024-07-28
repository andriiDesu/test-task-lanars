import 'package:flutter/material.dart';
import 'package:lanars_test/domain/models/user_name.dart';
import 'package:lanars_test/domain/models/user_picture.dart';

@immutable
class UserData {
  const UserData({
    required this.name,
    required this.email,
    required this.profileImage,
  });

  final UserName name;
  final String email;
  final UserPicture profileImage;
}
