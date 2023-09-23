import 'package:airplane_booking_app/data/datasources/remote_datasource/user_datasource.dart';
import 'package:airplane_booking_app/data/models/auth_model.dart';
import 'package:airplane_booking_app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDatasource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final UserService userService = UserService();

  Future<UserModel> register(AuthModel regis) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: regis.email,
        password: regis.password,
      );

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        name: regis.name,
        email: regis.email,
        hobby: regis.hobby,
        balance: 25000000,
      );

      await userService.postUser(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(AuthModel login) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: login.email,
        password: login.password,
      );
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: login.email,
        password: login.password,
      );

      UserModel user = await userService.getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
