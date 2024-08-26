import 'package:firebase_auth/firebase_auth.dart';
import 'package:iot_class_room/features/profile/domain/entities/user_entities.dart';

class ProfileModel extends ProfileEntities {
  ProfileModel(
      {required super.name,
      required super.email,
      required super.profileImageUrl,
      required super.uid});

  factory ProfileModel.fromFirebaseUser(User user) {
    return ProfileModel(
        name: user.displayName ?? '',
        email: user.email ?? '',
        profileImageUrl: user.photoURL ?? '',
        uid: user.uid ?? '');
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        profileImageUrl: json['profileImageUrl'] ?? '',
        uid: json['uId'] ?? '');
  }
}
