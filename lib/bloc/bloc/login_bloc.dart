import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../functions/login_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial(false)) {
    print("Checking started");
    on<CheckLogin>((event, emit) async {
      bool status = await getLoginStatus();
      print(status);
      emit(state.copyWith(isLogin: status));
    });
  }
}
