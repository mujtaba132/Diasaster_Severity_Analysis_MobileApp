import 'package:flutter/material.dart';
import 'package:fyp_project/Pages/Authentication/mainAuth/topImages/dropContainer.dart';

class AnimatedImageGrid extends StatelessWidget {
  const AnimatedImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: const [
        Drop_Container(
          height: 140,
          width: 120,
          topLeft: 40,
          topRight: 40,
          bottomLeft: 40,
          bottomRight: 12,
          image: 'assets/images/Image_01.jpg',
        ),
        Drop_Container(
          height: 140,
          width: 120,
          topLeft: 40,
          topRight: 40,
          bottomLeft: 12,
          bottomRight: 40,
          image: 'assets/images/Image_02.jpeg',
        ),
        Drop_Container(
          height: 140,
          width: 120,
          topLeft: 40,
          topRight: 12,
          bottomLeft: 40,
          bottomRight: 40,
          image: 'assets/images/Image_03.jpg',
        ),
        Drop_Container(
          height: 140,
          width: 120,
          topLeft: 12,
          topRight: 40,
          bottomLeft: 40,
          bottomRight: 40,
          image: 'assets/images/Image_04.jpg',
        ),
      ],
    );
  }
}
