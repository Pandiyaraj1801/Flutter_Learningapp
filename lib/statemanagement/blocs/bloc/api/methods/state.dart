import 'package:equatable/equatable.dart';

abstract class ApiBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ApiInitialState extends ApiBlocState {}

class ApiSuccessState extends ApiBlocState {
  final Map<String, dynamic> results;

  ApiSuccessState(this.results);
}

class ApiFailureState extends ApiBlocState {
  final Map<String, dynamic> errMsg;

  ApiFailureState(this.errMsg);
}
