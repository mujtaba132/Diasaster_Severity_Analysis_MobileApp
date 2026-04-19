
import 'package:firebase_auth/firebase_auth.dart';


class CurrentUserRepository {
    
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


    User? user()
    {
        return _firebaseAuth.currentUser;
    }

    String? userId()
    {
        return user()!.uid ;
    }

    String? userEmail()
    {
      return user()!.email;
    }

    String? userName()
    {
         String? userName = user()!.displayName;
         if(userName!=null || userName!.isNotEmpty)
         {
           return userName;
         }
         else{
            return userEmail()!.split('@').first;
         }
    }

    String? userProfileUrl()
    {
        return user()!.photoURL;
    }
   
}