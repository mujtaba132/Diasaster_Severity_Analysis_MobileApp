import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static bool _initialized = false;

   Future<void> initSignIn() async {
    if (!_initialized) {
      await _googleSignIn.initialize();
      _initialized = true;
    }
  }

   Future<UserCredential?> signInWithGoogle() async {
    try {
      await initSignIn();

      final googleUser = await _googleSignIn.authenticate();
      final idToken = googleUser.authentication.idToken;
      final authorizationClient = googleUser.authorizationClient;

      GoogleSignInClientAuthorization? authorization = await authorizationClient
          .authorizationForScopes(['email', 'profile']);

      final accessToken = authorization?.accessToken;

      if (accessToken == null || idToken == null) {
        throw FirebaseAuthException(
          code: "missing-token",
          message: "Failed to get token",
        );
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      print(userCredential);

      return userCredential;
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw TimeoutException('');
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
