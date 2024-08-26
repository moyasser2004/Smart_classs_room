import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:iot_class_room/features/home/domain/repositories/home_repo.dart';
import 'package:iot_class_room/shared/core/errors/failures.dart';
import 'package:iot_class_room/shared/core/services/firebase_real_time_data_service.dart';

import '../../../../shared/core/errors/exceptions.dart';

class HomeRepositoryImplement implements HomeRepo {
  final FirebaseRealTimeDataService<int> firebaseRealTimeDataService;

  HomeRepositoryImplement(
      {required this.firebaseRealTimeDataService});

  @override
  Stream<Either<Failure, int>> getHomeDataStream() async* {
    try {
      await for (final data
          in firebaseRealTimeDataService.dataStream) {
        if (data != null) {
          yield Right(data);
        } else {
          yield Left(ServerFailure('No data available'));
        }
      }
    } on CustomException catch (e) {
      yield Left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in HomeRepositoryImplement.getHomeDataStream: ${e.toString()}',
      );
      yield Left(
        ServerFailure(
          'An error occurred. Please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateHomeData(int data) async {
    try {
      await firebaseRealTimeDataService.updateData(data);
      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in HomeRepositoryImplement.updateHomeData: ${e.toString()}',
      );
      return Left(
        ServerFailure(
          'An error occurred. Please try again later.',
        ),
      );
    }
  }
}
