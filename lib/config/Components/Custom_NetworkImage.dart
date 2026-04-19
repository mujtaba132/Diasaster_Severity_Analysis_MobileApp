import 'package:flutter/material.dart';

class CustomNetworkimage extends StatelessWidget {
  final String imageUrl;
  final double iconSize;
  final IconData icon;
  final double height;
  final String errorText;
  final double borderRadius;
  const CustomNetworkimage({
    super.key,
    required this.imageUrl,
    this.iconSize = 40,
    this.height=450,
    this.borderRadius=12,
    this.icon = Icons.image_not_supported,
    this.errorText = "Media not available"});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
  borderRadius: BorderRadius.circular(borderRadius),
  child: Image.network(
    imageUrl, 
    height: height,
    width: double.infinity,
    fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return SizedBox(
        height: height,
        width: double.infinity,
        child: Center(
          child: Text("Loading..",style: theme.textTheme.bodyMedium),
        ),
      );
    },
    errorBuilder: (context, error, stackTrace) {
      return SizedBox(
        height: height,
        width: double.infinity,
        child: Center(
          child:  Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: Colors.grey),
          SizedBox(height: 6),
          Text(
            errorText,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    ),
        ),
      );
    },
  ),
);
  }
}