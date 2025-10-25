import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/core/error/error.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/domain/usecase/api_usecase.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/presentation/bloc/event.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/presentation/bloc/state.dart';

class ApiCleanArchBloc extends Bloc<ApiCleanArchEvent, ApiCleanArchState> {
  ApiCleanArchUseCase useCase;

  ApiCleanArchBloc(this.useCase) : super(ApiCleanArchInitialState()) {
    on<ApiCleanArchInitialEvent>(fetchApi);
  }

  Future<void> fetchApi(
    ApiCleanArchInitialEvent event,
    Emitter<ApiCleanArchState> emit,
  ) async {
    emit(ApiCleanArchLoadingState());

    try {
      Either<Failure, Map<String, dynamic>> result = await useCase.repository
          .getApi();

      result.fold(
        (lf) {
          emit(ApiCleanArchFailureState(lf.errMsg));
        },
        (rf) {
          emit(ApiCleanArchSuccessState(rf));
        },
      );
    } catch (e) {
      Map<String, dynamic> err = {"status": "E", "errMsg": e.toString()};

      emit(ApiCleanArchFailureState(err));
    }
  }
}
