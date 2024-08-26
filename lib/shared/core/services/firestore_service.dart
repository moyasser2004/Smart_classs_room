import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/profile/data/models/profile_model.dart';
import '../../../features/profile/domain/entities/user_entities.dart';
import '../errors/exceptions.dart';
import 'data_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<ProfileEntities> getUserData(
      {required String path, required String uid}) async {
    try {
      var querySnapshot = await firestore
          .collection("users")
          .where("uId", isEqualTo: uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var documentSnapshot = querySnapshot.docs.first;

        var data = documentSnapshot.data();
        return ProfileModel.fromJson(data);
      } else {
        throw Exception("Document with uid '$uid' does not exist");
      }
    } catch (e) {
      log("Exception in AuthRepoImpl.getUserProfile: $e");
      throw CustomException(
          message: "Error getting user data from firestore.");
    }
  }

  @override
  Future<void> updateData(
      {required String uid,
      required String path,
      required ProfileEntities data}) async {
    try {
      print(
          'Updating document at path: ${firestore.collection('users').doc("9dQj81GoMpfbIlHiMLPkDnXjO7w1").path}');
      await firestore.collection(path).doc(uid).update(data.toJson());
    } on FirebaseAuthException catch (e) {
      log("Exception in FireBaseStorageService.getUserProfile: ${e.toString()} and code is ${e.code}");
      throw CustomException(
          message: "Error getting user data from firestore.");
    } catch (e) {
      log("Exception in FireBaseStorageService.getUserProfile: ${e.toString()}");
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
}
