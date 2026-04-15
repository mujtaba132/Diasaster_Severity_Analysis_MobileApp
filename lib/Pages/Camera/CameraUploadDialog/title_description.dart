import 'package:flutter/material.dart';

class TitleDescription extends StatelessWidget {
  const TitleDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
            // Title
              Text(
                "Upload File",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // Description
              Text(
                "Upload your image or video here.\nMake sure the file is clear and valid.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
      ],
    );
  }
}