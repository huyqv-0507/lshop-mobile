import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String userName;
  String password;
  String fullName;
  String email;
  int roleId;
  User(this.userName, this.password, this.fullName, this.email, this.roleId);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
