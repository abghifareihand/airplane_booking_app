part of 'logout_bloc.dart';

abstract class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutLoaded extends LogoutState {}

final class LogoutError extends LogoutState {
  final String error;
  LogoutError({
    required this.error,
  });
}
