import 'package:flutter/material.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'dart:async';
import 'package:fyp_project/services/Splash/splash_service.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // final SplashScreenService _splashScreenService = SplashScreenService();

  @override
  void initState(){
    super.initState();
     Timer(const Duration(seconds: 5),()=> Navigator.pushNamed(context, RoutesName.mainScreen));
    // Timer(const Duration(seconds: 5),()=> _splashScreenService.splashScreenNavigator(context));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor:theme.primaryColor,
      body: SafeArea(
        child: 
             Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Disaster App",
                          style: TextStyle(color:Colors.white,fontSize: 22)),
                        ]
                      )
              ],
             )
      )
    );
  }
}