import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:fyp_project/services/Auth/firebase_signup_service.dart';

class SignupRepository {

  Future<UserCredential?> createAccount({
    required String email,
    required String password,
  }) async {

    try {

        final userCredential = await SignUpService.createAccount(
          email: email,
          password: password,
        );
      
      return userCredential;
    } catch (e) {
        throw GeneralException(e.toString());
    }
}

  Future<bool> waitForEmailVerification(User user) async{

       try{

          bool isVerified =   await SignUpService.waitForEmailVerification(user,timeoutSeconds: 120);  
          return isVerified;           
       } 
       catch (e)
       {
         throw GeneralException(e.toString());
       }
  }

} 