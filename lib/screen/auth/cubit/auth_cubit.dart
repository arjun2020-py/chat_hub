import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.context) : super(AuthInitial());
  BuildContext context;
  bool isChecked = true;
  isCheckAuth() {
    isChecked = !isChecked;
    emit(AuthInitial());
  }
}
