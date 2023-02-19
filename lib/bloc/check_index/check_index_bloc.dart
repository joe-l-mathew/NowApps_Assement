import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_index_event.dart';
part 'check_index_state.dart';

class CheckIndexBloc extends Bloc<CheckIndexEvent, CheckIndexState> {
  CheckIndexBloc() : super(CheckIndexInitial()) {
    on<AddNewIndex>((event, emit) {
      // print("Call reached");
      print(event.index);
      emit(state.copyWith(index: event.index));
      // print(state.index);
    });
  }
}
