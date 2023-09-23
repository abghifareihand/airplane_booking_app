// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserEvent {}

class GetUserEvent extends UserEvent {
  final String id;
  GetUserEvent({
    required this.id,
  });
}
