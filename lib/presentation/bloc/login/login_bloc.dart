// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:airplane_booking_app/data/models/auth_model.dart';
import 'package:airplane_booking_app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:airplane_booking_app/data/datasources/remote_datasource/auth_datasource.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDatasource authDatasource;
  LoginBloc(
    this.authDatasource,
  ) : super(LoginInitial()) {
    on<SendLoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await authDatasource.login(event.model);
        emit(LoginLoaded(user));
      } catch (e) {
        emit(LoginError(error: 'Login Error'));
      }
    });
  }
}
