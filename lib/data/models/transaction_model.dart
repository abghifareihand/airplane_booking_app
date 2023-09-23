import 'package:airplane_booking_app/data/models/destination_model.dart';

class TransactionModel {
  final DestinationModel destination;
  final String id;
  final int amountTraveler;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;
  TransactionModel({
    required this.destination,
    this.id = '',
    required this.amountTraveler,
    required this.selectedSeats,
    required this.insurance,
    required this.refundable,
    required this.vat,
    required this.price,
    required this.grandTotal,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) {
    return TransactionModel(
      destination: DestinationModel.fromJson(
          json['destination']['id'], json['destination']),
      id: id,
      amountTraveler: json['amountTraveler'],
      selectedSeats: json['selectedSeats'],
      insurance: json['insurance'],
      refundable: json['refundable'],
      vat: json['vat'],
      price: json['price'],
      grandTotal: json['grandTotal'],
    );
  }
}
