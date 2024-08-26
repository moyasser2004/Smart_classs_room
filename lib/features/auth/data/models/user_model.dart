import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.name,
      required super.profileImageUrl,
      required super.email,
      required super.uId});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      profileImageUrl: '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      profileImageUrl: '',
    );
  }
}
