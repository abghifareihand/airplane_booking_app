part of 'destination_bloc.dart';


abstract class DestinationState {}

final class DestinationInitial extends DestinationState {}


final class DestinationLoading extends DestinationState {}

final class DestinationLoaded extends DestinationState {
  /// Response
  List<DestinationModel> destination;
  DestinationLoaded({
    required this.destination,
  });
}

final class DestinationError extends DestinationState {
  final String error;
  DestinationError({
    required this.error,
  });
}
