// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class UserModel {
  final String email;
  final String registerTypes;
  final String imgAvatar;

  UserModel({
    required this.email,
    required this.registerTypes,
    required this.imgAvatar,
  });

  UserModel.empty()
      : email = '',
        registerTypes = '',
        imgAvatar = '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'register_type': registerTypes,
      'img_avatar': imgAvatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      registerTypes: map['register_type'] ?? '',
      imgAvatar: map['img_avatar'] ?? ' ',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
