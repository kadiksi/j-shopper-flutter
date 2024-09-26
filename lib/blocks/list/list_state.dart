part of 'list_bloc.dart';

abstract class ListState extends Equatable {}

class ListInitial extends ListState {
  @override
  List<Object?> get props => [];
}

class ListLoading extends ListState {
  @override
  List<Object?> get props => [];
}

class ListSuccess extends ListState {
  ListSuccess({
    required this.tasks,
  });

  final List<TaskDataModel> tasks;

  @override
  List<Object?> get props => [tasks];
}

class ListFailure extends ListState {
  ListFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
