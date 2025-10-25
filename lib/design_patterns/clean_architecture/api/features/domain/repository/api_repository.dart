import 'package:fpdart/fpdart.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/core/error/error.dart';

abstract interface class ApiCleanRepository {
  Future<Either<Failure, Map<String, dynamic>>> getApi();
}
