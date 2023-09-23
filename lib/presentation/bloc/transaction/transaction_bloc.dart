// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:airplane_booking_app/data/datasources/remote_datasource/transaction_datasource.dart';
import 'package:airplane_booking_app/data/models/transaction_model.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionDatasource datasource;
  TransactionBloc(
    this.datasource,
  ) : super(TransactionInitial()) {
    on<CreateTransactionEvent>((event, emit) async {
      emit(TransactionLoading());
      try {
        await datasource.createtransaction(event.model);
        emit(TransactionLoaded([]));
      } catch (e) {
        emit(TransactionError(error: 'Gagal Melakukan Transaksi'));
      }
    });
    on<GetTransactionsEvent>((event, emit) async {
      emit(TransactionLoading());
      try {
        final user = FirebaseAuth.instance.currentUser;
        final result = await datasource.getTransactions(user!.uid);
        emit(TransactionLoaded(result));
      } catch (e) {
        emit(TransactionError(error: 'Gagal Get Transaksi'));
      }
    });
  }
}
