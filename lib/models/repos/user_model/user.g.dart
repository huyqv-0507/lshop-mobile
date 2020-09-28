// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['userName'] as String,
    json['password'] as String,
    json['fullName'] as String,
    json['email'] as String,
    json['roleId'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'fullName': instance.fullName,
      'email': instance.email,
      'roleId': instance.roleId,
    };
