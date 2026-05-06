import 'package:flutter/material.dart';

class TitleDescription extends StatelessWidget {

  final String? title;
  final String? description;
  const TitleDescription({
    super.key,
    this.title,
    this.description
    });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
              title!=null?
              // Title
                Text(
                  title!,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ): const SizedBox.shrink(),
      
                const SizedBox(height: 8),
      
                // Description
                description!=null?
                Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ): const SizedBox.shrink(),
        ],
    );
  }
}