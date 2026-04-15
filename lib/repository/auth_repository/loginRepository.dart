import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:fyp_project/services/Auth/firebase_login_service.dart';
import 'package:fyp_project/services/Auth/google_signIn_service.dart';

class LoginRepository {

  static final GoogleSignInService _googleSignInService = GoogleSignInService();
  static final LoginService _loginService = LoginService();

  Future<UserCredential> loginWithGoogle() async {

    UserCredential? credential = await _googleSignInService.signInWithGoogle()
    .onError((error, stackTrace) {
          throw GeneralException(error.toString());
        });

    if (credential == null) {
      throw GeneralException('User credientials are null');
    }

    return credential;
  }

  
  Future<UserCredential> firebaseLogin({required String email,required String password}) async{

      UserCredential? credential = await  _loginService.login(email: email, password: password)
      .onError((error, stackTrace) {
            throw GeneralException(error.toString());
      }); 

      if(credential == null)
      {
         throw GeneralException('User credientails are null');
      } 

       return credential;
  }  

}
