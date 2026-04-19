import 'package:flutter/material.dart';

class CitizenFeedCommentHeader extends StatelessWidget {
  const CitizenFeedCommentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Comments",
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}