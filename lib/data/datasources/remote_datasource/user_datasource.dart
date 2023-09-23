import 'package:airplane_booking_app/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> postUser(UserModel user) async {
    try {
      userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        hobby: snapshot['hobby'],
        balance: snapshot['balance'],
      );
    } catch (e) {
      rethrow;
    }
  }

  


}