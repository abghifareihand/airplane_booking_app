part of 'register_bloc.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterLoaded extends RegisterState {
  /// Response
  final UserModel userModel;
  RegisterLoaded(
    this.userModel,
  );
}

final class RegisterError extends RegisterState {
  final String error;
  RegisterError({
    required this.error,
  });
}
