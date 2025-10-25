import 'package:fpdart/fpdart.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/core/error/error.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/core/usecases/usecases.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/domain/repository/api_repository.dart';

class ApiCleanArchUseCase implements UseCase {
  ApiCleanRepository repository;

  ApiCleanArchUseCase(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call() async {
    return await repository.getApi();
  }
}
