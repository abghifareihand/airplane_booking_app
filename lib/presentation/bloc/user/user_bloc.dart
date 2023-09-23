import 'package:airplane_booking_app/data/models/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:airplane_booking_app/data/datasources/remote_datasource/user_datasource.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;
  UserBloc(
    this.userService,
  ) : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final result = await userService.getUserById(event.id);
        debugPrint('Cek name: ${result.name}');
        emit(UserLoaded(user: result));
      } catch (e) {
        emit(UserError(error: 'Get User Error'));
      }
    });
  }
}
