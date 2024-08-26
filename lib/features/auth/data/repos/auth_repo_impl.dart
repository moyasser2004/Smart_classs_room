import 'dart:developer';
import 'package:dartz/dartz.dart';

import '../../../../shared/core/errors/exceptions.dart';
import '../../../../shared/core/errors/failures.dart';
import '../../../../shared/core/services/data_service.dart';
import '../../../../shared/core/services/firebase_auth_service.dart';
import '../../../../shared/core/services/shared_preferences_singleton.dart';
import '../../../../shared/utils/backend_endpoint.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService,
      required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final user =
          await firebaseAuthService.createUserWithEmailAndPassword(
              email: email, password: password);

      UserEntity userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
        profileImageUrl: '',
      );

      await addUserData(user: userEntity);
      SharedPreferencesHelper.setString("uid", user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser();
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser();
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user =
          await firebaseAuthService.signInWithEmailAndPassword(
              email: email, password: password);

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signinWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthService.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser();
      log(
        'Exception in AuthRepoImpl.signinWithGoogle: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.addUserData,
        data: user.toJson(),
      );
    } catch (e) {
      log('Exception in AuthRepoImpl.addUserData: ${e.toString()}');
      throw CustomException(
          message: 'Unable to add user data to the database.');
    }
  }

  Future<void> deleteUser() async {
    try {
      await firebaseAuthService.deleteUser();
    } catch (e) {
      log('Exception in AuthRepoImpl.deleteUser: ${e.toString()}');
    }
  }
}
