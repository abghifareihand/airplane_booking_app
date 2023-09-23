part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {
  /// Response
  final UserModel userModel;
  LoginLoaded(
    this.userModel,
  );
}

final class LoginError extends LoginState {
  final String error;
  LoginError({
    required this.error,
  });
}
