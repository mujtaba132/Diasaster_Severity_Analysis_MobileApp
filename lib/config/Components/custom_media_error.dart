import 'package:flutter/material.dart';

class CustomMediaError extends StatelessWidget {
  const CustomMediaError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
          SizedBox(height: 6),
          Text(
            "Image not available",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}