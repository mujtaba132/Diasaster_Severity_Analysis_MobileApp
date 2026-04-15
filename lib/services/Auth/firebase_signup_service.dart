import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';

class SignUpService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserCredential?> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user == null) throw GeneralException("User creation failed.");

      await userCredential.user!.sendEmailVerification();

      return userCredential;
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw TimeoutException('');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw GeneralException('Password too weak.');
      } else if (e.code == 'email-already-in-use') {
          throw GeneralException('Email already in use.');
      } else if (e.code == 'invalid-email') {
        throw GeneralException('Invalid email.');
      } else {
        throw GeneralException(e.message ?? 'FirebaseAuth Error.');
      }
    } catch (error) {
      throw GeneralException(error.toString());
    }
  }

  static Future<bool> waitForEmailVerification(
    User user, {
    int timeoutSeconds = 60,
  }) async {

    print('Time Out for Verification is here...$timeoutSeconds');
    int elapsed = 0;
    while (elapsed < timeoutSeconds) {
      await Future.delayed(const Duration(seconds: 3));

      await _auth.currentUser?.reload();
      User? refreshedUser = _auth.currentUser;

      if (refreshedUser != null && refreshedUser.emailVerified) {
        return true;
      }

      elapsed += 3;
    }
    return false;
  }

  static Future<void> deleteUnverifiedUser(
    String email,
    String password,
  ) async {
    try {

      UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
      );

      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      await user!.reauthenticateWithCredential(credential);
      await user.delete();

      print("User deleted successfully");
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
