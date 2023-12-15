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
      'registerTypes': registerTypes,
      'imgAvatar': imgAvatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      registerTypes: map['registerTypes'] as String,
      imgAvatar: map['imgAvatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
