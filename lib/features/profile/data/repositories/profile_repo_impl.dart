import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:iot_class_room/features/profile/domain/entities/user_entities.dart';

import '../../../../shared/core/errors/failures.dart';
import '../../../../shared/core/services/data_service.dart';
import '../../../../shared/core/services/firebase_auth_service.dart';
import '../../../../shared/utils/backend_endpoint.dart';
import '../../domain/repositories/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final DatabaseService databaseService;
  final FirebaseAuthService firebaseAuthService;

  ProfileRepoImpl(
      {required this.databaseService,
      required this.firebaseAuthService});

  @override
  Future<Either<Failure, ProfileEntities>> getUserProfile(
      String uid) async {
    try {
      final userEntity = await databaseService.getUserData(
        path: BackendEndpoint.addUserData,
        uid: uid,
      );
      return right(userEntity);
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.getUserProfile: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> updateUserImage(
      String imageUrl, String email, String name, String uid) async {
    try {
      ProfileEntities profile = ProfileEntities(
        name: name,
        email: email,
        profileImageUrl: imageUrl,
        uid: uid,
      );

      await databaseService.updateData(
        path: BackendEndpoint.addUserData,
        uid: uid,
        data: profile,
      );

      return right(true);
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.updateUserProfile: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAccount() async {
    try {
      await firebaseAuthService
          .deleteUser(); // Assuming deleteUser() is async
      return Future.value(right(true));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.deleteAccount: ${e.toString()}',
      );
      return Future.value(left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await firebaseAuthService.logout();
      return Future.value(right(true));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.deleteAccount: ${e.toString()}',
      );
      return Future.value(left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      ));
    }
  }
}
