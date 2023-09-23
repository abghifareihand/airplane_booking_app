part of 'transaction_bloc.dart';

abstract class TransactionState {}

final class TransactionInitial extends TransactionState {}

final class TransactionLoading extends TransactionState {}

final class TransactionLoaded extends TransactionState {
  /// Response
  final List<TransactionModel> transaction;
  TransactionLoaded(
    this.transaction,
  );
}

final class TransactionError extends TransactionState {
  final String error;
  TransactionError({
    required this.error,
  });
}
