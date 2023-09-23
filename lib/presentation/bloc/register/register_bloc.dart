import 'package:airplane_booking_app/data/datasources/remote_datasource/auth_datasource.dart';
import 'package:airplane_booking_app/data/models/auth_model.dart';
import 'package:airplane_booking_app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDatasource datasource;
  RegisterBloc(
    this.datasource,
  ) : super(RegisterInitial()) {
    on<SendRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final user = await datasource.register(event.model);
        emit(RegisterLoaded(user));
      } catch (e) {
        emit(RegisterError(error: 'Register $e'));
      }
    });
  }
}
