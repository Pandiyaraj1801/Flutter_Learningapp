import 'package:fpdart/fpdart.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/core/error/error.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/data/datasource/api_datasource.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/domain/repository/api_repository.dart';

class ApiCleanArchRepoImpl implements ApiCleanRepository {
  ApiCleanArchDataSource dataSource;

  ApiCleanArchRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getApi() async {
    return await dataSource.getApi();
  }
}
