import 'package:equatable/equatable.dart';

abstract class ApiCleanArchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ApiCleanArchInitialEvent extends ApiCleanArchEvent {}
