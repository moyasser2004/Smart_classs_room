import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import '../errors/exceptions.dart';

class FirebaseRealTimeDataService<T> {
  final DatabaseReference _reference;

  FirebaseRealTimeDataService(String path)
      : _reference = FirebaseDatabase.instance.ref().child(path);

  Stream<T?> get dataStream {
    return _reference.onValue.map((event) {
      return event.snapshot.value as T?;
    });
  }

  Future<void> updateData(T data) async {
    try {
      await _reference.set(data);
    } on FirebaseException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
}
