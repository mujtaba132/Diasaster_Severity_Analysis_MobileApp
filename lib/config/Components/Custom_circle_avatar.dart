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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CircleAvatar(
      radius: radius,
      backgroundColor:
          backgroundColor ??
          theme.colorScheme.primary.withOpacity(0.12),

      child: ClipOval(
        child:
            imageUrl == null || imageUrl!.trim().isEmpty
                ? _buildFallback(theme)
                : Image.network(
                  imageUrl!,
                  width: radius * 2,
                  height: radius * 2,
                  fit: BoxFit.cover,

                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;

                    return _buildFallback(theme);
                  },

                  errorBuilder: (context, error, stackTrace) {
                    return _buildFallback(theme);
                  },
                ),
      ),
    );
  }


  Widget _buildFallback(ThemeData theme) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withOpacity(0.4),
            theme.colorScheme.primary.withOpacity(0.7),
          ],
          begin: Alignment.topLeft, 
          end: Alignment.bottomRight,
        ),
      ),

      child: Icon(
        Icons.person_rounded,
        size: radius * 1.2,
        color: Colors.white,
      ),
    );
  }
}