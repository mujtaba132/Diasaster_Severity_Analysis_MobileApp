import 'package:flutter/material.dart';

class ForgetAnimatedContainer extends StatelessWidget {
  const ForgetAnimatedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutBack,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primary.withOpacity(0.7),
                ],
              ),
            ),
            child: const Icon(Icons.lock_reset, size: 40, color: Colors.white),
          ),
        ),

        const SizedBox(height: 30),

        /// Title
        Text(
          "Password Reset",
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "Enter your email to receive a reset link",
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
