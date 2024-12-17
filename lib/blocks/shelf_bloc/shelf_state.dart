part of 'shelf_bloc.dart';

abstract class ShelfState extends Equatable {}

class ShelfInitial extends ShelfState {
  @override
  List<Object?> get props => [];
}

class ShelfLoading extends ShelfState {
  @override
  List<Object?> get props => [];
}

class ShelfSuccess extends ShelfState {
  ShelfSuccess({
    required this.tasks,
  });

  final List<Shelf> tasks;

  @override
  List<Object?> get props => [tasks];
}

class ShelfFailure extends ShelfState {
  ShelfFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
