import 'package:flutter/material.dart';
import 'package:fyp_project/Pages/Authentication/mainAuth/topImages/animatedImageGrid.dart';
import 'package:fyp_project/responsible/mediaquery.dart';

class TopImages extends StatefulWidget {
  const TopImages({super.key});

  @override
  State<TopImages> createState() => _TopImagesState();
}

class _TopImagesState extends State<TopImages> {
  @override
  Widget build(BuildContext context) {
    final Responsive app = Responsive(context);
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: app.screenWidth() * 0.06,
              vertical: app.screenheight() * 0.02,
            ),
            child: Center(child: AnimatedImageGrid()),
          ),
        ),

        SizedBox(height: app.screenheight() * 0.49),
      ],
    );
  }
}
