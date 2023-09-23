// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'transaction_bloc.dart';

abstract class TransactionEvent {}

class CreateTransactionEvent extends TransactionEvent {
  /// Request
  final TransactionModel model;
  CreateTransactionEvent({
    required this.model,
  });
}

class GetTransactionsEvent extends TransactionEvent {

}

class MyTransactionsEvent extends TransactionEvent {
  
}
