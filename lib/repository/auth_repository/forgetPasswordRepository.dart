import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';

class Forgetpasswordrepository {

    final FirebaseAuth _auth = FirebaseAuth.instance;
    
    Future<void> sendPasswordResetEmail({required String email}) async {
    try {

      await _auth.sendPasswordResetEmail(email: email);
     
    } on SocketException {
        throw NoInternetException('');
    } on TimeoutException {
        throw TimeoutException('');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found with this email.');
      } else if (e.code == 'invalid-email') {
        throw Exception('Invalid email address.');
      } else if (e.code == 'missing-android-pkg-name' ||
          e.code == 'missing-ios-bundle-id') {
        throw Exception('Missing app configuration for password reset.');
      } else {
        throw Exception(e.message ?? 'FirebaseAuth Error.');
      }
    } catch (e) {
        throw GeneralException(e.toString());
    }
  }
}
