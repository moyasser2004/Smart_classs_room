import 'package:iot_class_room/features/profile/domain/entities/user_entities.dart';

abstract class DatabaseService {
  Future<void> addData(
      {required String path, required Map<String, dynamic> data});

  Future<ProfileEntities> getUserData(
      {required String path, required String uid});

  Future<void> updateData(
      {required String uid,
      required String path,
      required ProfileEntities data});
}
