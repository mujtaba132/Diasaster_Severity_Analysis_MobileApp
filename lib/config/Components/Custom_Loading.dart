import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {

   final double size;
   final Color color;
   const CustomLoading({super.key,this.size=20,required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 3));
  }
}