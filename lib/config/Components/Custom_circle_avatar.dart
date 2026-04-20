import 'package:flutter/material.dart';


class CustomCircleAvatar extends StatelessWidget {
  final String? imageUrl;
  final String userName;
  final double radius;
  final Color? backgroundColor;

  const CustomCircleAvatar({
    super.key,
    this.imageUrl,
    required this.userName,
    this.radius = 22,
    this.backgroundColor,
  });

  String get initials {
    if (userName.isEmpty) return '';
    List<String> parts = userName.trim().split(' ');
    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    }
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? theme.colorScheme.primary.withOpacity(0.8),
      child: ClipOval(
        child: imageUrl == null || imageUrl!.isEmpty
            ? _buildFallback()
            : Image.network(
                imageUrl!,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,

                // Loading
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                   return const SizedBox.shrink();
                },

                // Error
                errorBuilder: (context, error, stackTrace) {
                  return _buildFallback();
                },
              ),
      ),
    );
  }

  Widget _buildFallback() {
    return Center(
      child: Text(
        initials,
        style: TextStyle(
          fontSize: radius * 0.8,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}