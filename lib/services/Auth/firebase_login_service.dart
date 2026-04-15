import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';

class LoginService {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

   Future<UserCredential?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw TimeoutException('');
    } on FirebaseAuthException catch (e) {
      throw GeneralException(e.toString());
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

   Future<void> logout() async {
    await _auth.signOut();
  }
}
