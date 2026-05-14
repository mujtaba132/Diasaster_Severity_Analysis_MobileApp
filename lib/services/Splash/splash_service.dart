import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/ModulePages/module.dart';
import 'package:fyp_project/config/routes/routes_arguments/homepage_arguments.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/services/Splash/user_role_service.dart';

class SplashScreenService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  void splashScreenNavigator(BuildContext context) async {
    User? user = _auth.currentUser;

    if (user != null) {
      String userRole = await RoleService.getUserRole();

      if (userRole == 'user') {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.homeScreen,
          (route) => false,
          arguments: HomePageArguments(pages: AppModule().user),
        );
      } else if (userRole == 'admin') {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.homeScreen,
          (route) => false,
          arguments: HomePageArguments(pages: AppModule().admin),
        );
      }
    } else {
      Navigator.pushNamed(context, RoutesName.mainScreen);
    }
  }
}
