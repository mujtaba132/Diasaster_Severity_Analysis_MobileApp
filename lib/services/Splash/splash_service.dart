import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/config/routes/routes_name.dart';

class SplashScreenService {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

   void splashScreenNavigator(BuildContext context) {
    User? user = _auth.currentUser;
    if (user != null) {
      Navigator.pushNamed(context, RoutesName.homeScreen);
    } else {
      Navigator.pushNamed(context, RoutesName.mainScreen);
    }
  }
}
