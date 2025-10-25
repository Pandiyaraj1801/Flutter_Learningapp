import 'package:equatable/equatable.dart';

abstract class ApiCleanArchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ApiCleanArchInitialState extends ApiCleanArchState {}

class ApiCleanArchLoadingState extends ApiCleanArchState {}

class ApiCleanArchSuccessState extends ApiCleanArchState {
  final Map<String, dynamic> result;

  ApiCleanArchSuccessState(this.result);
}

class ApiCleanArchFailureState extends ApiCleanArchState {
  final Map<String, dynamic> result;

  ApiCleanArchFailureState(this.result);
}
