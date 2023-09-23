import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airplane_booking_app/data/datasources/remote_datasource/auth_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthDatasource datasource;
  LogoutBloc(
    this.datasource,
  ) : super(LogoutInitial()) {
    on<DoLogoutEvent>((event, emit) async {
      emit(LogoutLoading());
      try {
        await datasource.logout();
        emit(LogoutLoaded());
      } catch (e) {
        emit(LogoutError(error: 'Logout Gagal'));
      }
    });
  }
}
