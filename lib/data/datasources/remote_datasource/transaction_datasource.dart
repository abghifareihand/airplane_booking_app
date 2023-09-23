import 'package:airplane_booking_app/data/datasources/remote_datasource/user_datasource.dart';
import 'package:airplane_booking_app/data/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionDatasource {
  final CollectionReference transactionReference =
      FirebaseFirestore.instance.collection('transactions');
  final UserService userService = UserService();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> createtransaction(TransactionModel transaction) async {
    try {
      await transactionReference
          .doc(user!.uid)
          .collection(user!.email ?? 'Unknown')
          .add({
        'destination': transaction.destination.toJson(),
        'amountTraveler': transaction.amountTraveler,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> getTransactions(String userUid) async {
    try {
      QuerySnapshot result = await transactionReference
          .doc(userUid)
          .collection(user!.email ?? 'Unknown')
          .get();

      List<TransactionModel> transactions = result.docs
          .map((x) =>
              TransactionModel.fromJson(x.id, x.data() as Map<String, dynamic>))
          .toList();

      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
