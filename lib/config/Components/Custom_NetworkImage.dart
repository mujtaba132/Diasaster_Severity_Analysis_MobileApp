import 'package:flutter/material.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';

class CustomNetworkimage extends StatelessWidget {
  final String imageUrl;
  const CustomNetworkimage({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: Image.network(
    imageUrl, 
    height: 450,
    width: double.infinity,
    fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return SizedBox(
        height: 450,
        width: double.infinity,
        child: Center(
          child: CustomLoading(color: Theme.of(context).primaryColor),
        ),
      );
    },
    errorBuilder: (context, error, stackTrace) {
      return SizedBox(
        height: 450,
        width: double.infinity,
        child: Center(
          child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
        ),
      );
    },
  ),
);
  }
}