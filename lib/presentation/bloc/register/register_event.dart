// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

abstract class RegisterEvent {}

class SendRegisterEvent extends RegisterEvent {
  /// Request
  final AuthModel model;
  SendRegisterEvent({
    required this.model,

  });
}