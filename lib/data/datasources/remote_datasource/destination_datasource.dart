import 'package:airplane_booking_app/data/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationDatasource {
  final CollectionReference destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> getAllDestination() async {
    try {
      QuerySnapshot result = await destinationReference.get();
      List<DestinationModel> destinations = result.docs
          .map((x) =>
              DestinationModel.fromJson(x.id, x.data() as Map<String, dynamic>))
          .toList();

      return destinations;
    } catch (e) {
      rethrow;
    }
  }
}
