import 'package:fpdart/fpdart.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/core/error/error.dart';

abstract interface class UseCase<SuccessType, Param> {
  Future<Either<Failure, SuccessType>> call();
}

abstract interface class UseCaseParam<SuccessType, Param> {
  Future<Either<Failure, SuccessType>> call(Param param);
}
