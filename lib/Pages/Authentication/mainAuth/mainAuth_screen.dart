import 'package:flutter/material.dart';
import 'package:fyp_project/Pages/Authentication/mainAuth/bottomCard/bottom_card.dart';
import 'package:fyp_project/Pages/Authentication/mainAuth/topImages/top_Images.dart';

class MainAuthScreen extends StatefulWidget {
  const MainAuthScreen({super.key});


  @override
  State<MainAuthScreen> createState() => _MainAuthScreenState();
}

class _MainAuthScreenState extends State<MainAuthScreen> {


@override
Widget build(BuildContext context) {

  return Scaffold(
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [

              // ---------- TOP IMAGE AREA ----------

              Positioned.fill(child: TopImages()),

              // ---------- BOTTOM CARD ----------
            
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomCard(),
              ),
            ],
          );
        },
      ),
    ),
  );
}
}


