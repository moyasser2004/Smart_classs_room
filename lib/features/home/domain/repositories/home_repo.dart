import 'package:dartz/dartz.dart';
import '../../../../shared/core/errors/failures.dart';

abstract class HomeRepo {
  Stream<Either<Failure, int>> getHomeDataStream();
  Future<Either<Failure, void>> updateHomeData(int data);
}
