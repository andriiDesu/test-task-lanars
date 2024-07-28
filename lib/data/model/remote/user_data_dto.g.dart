// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataDto _$UserDataDtoFromJson(Map<String, dynamic> json) => UserDataDto(
      name: UserNameDto.fromJson(json['name'] as Map<String, dynamic>),
      picture: UserPictureDto.fromJson(json['picture'] as Map<String, dynamic>),
      email: json['email'] as String,
    );
