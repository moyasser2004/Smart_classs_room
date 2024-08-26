import 'package:dartz/dartz.dart';

import '../../../../shared/core/errors/failures.dart';
import '../entities/user_entities.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileEntities>> getUserProfile(String uid);
  Future<Either<Failure, bool>> updateUserImage(
      String imageUrl, String email, String name, String uid);

  Future<Either<Failure, bool>> deleteAccount();
  Future<Either<Failure, bool>> logout();
}
