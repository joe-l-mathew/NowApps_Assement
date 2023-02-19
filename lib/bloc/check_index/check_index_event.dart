part of 'check_index_bloc.dart';

@immutable
abstract class CheckIndexEvent {}

class AddNewIndex extends CheckIndexEvent {
  final int? index;

  AddNewIndex({required this.index}) {
    print(index);
  }
}
