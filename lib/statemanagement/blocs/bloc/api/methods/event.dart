import 'package:equatable/equatable.dart';

abstract class ApiBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ApiInitialEvent extends ApiBlocEvent {}
