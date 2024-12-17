part of 'shelf_bloc.dart';

abstract class ShelfEvent extends Equatable {}

class LoadShelf extends ShelfEvent {
  LoadShelf({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
