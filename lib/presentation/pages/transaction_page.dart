import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:airplane_booking_app/presentation/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionBloc>().add(GetTransactionsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        }

        if (state is TransactionLoaded) {
          if (state.transaction.isEmpty) {
            return Center(
              child: Text(
                'Kamu belum ada transaksi',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: state.transaction.length,
              itemBuilder: (context, index) {
                return TransactionCard(transaction: state.transaction[index]);
              },
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}
