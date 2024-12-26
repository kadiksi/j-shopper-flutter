part of 'list_bloc.dart';

abstract class ListEvent extends Equatable {}

class LoadAcceptedList extends ListEvent {
  LoadAcceptedList({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class LoadNewList extends ListEvent {
  LoadNewList({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
