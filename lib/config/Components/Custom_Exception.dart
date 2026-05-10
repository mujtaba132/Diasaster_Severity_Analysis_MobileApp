import 'dart:ui';
import 'package:flutter/material.dart';

class CustomException extends StatefulWidget {
  final String title;
  final String message;
  final IconData icon;
  final VoidCallback? onRetry;

  const CustomException({
    super.key,
    this.title = 'Something went wrong',
    required this.message,
    this.icon = Icons.error_outline_rounded,
    this.onRetry,
  });

  @override
  State<CustomException> createState() => _CustomExceptionState();
}

class _CustomExceptionState extends State<CustomException>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scale = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: FadeTransition(
        opacity: _fade,
        child: ScaleTransition(
          scale: _scale,

          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 28,
            ),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),

              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                        const Color(0xff0F172A),
                        const Color(0xff111827),
                      ]
                    : [
                        Colors.white,
                        const Color(0xffF8FAFC),
                      ],
              ),

              border: Border.all(
                color: Colors.grey.withOpacity(0.12),
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// 🌟 ICON WITH GLOW
                Container(
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        theme.primaryColor.withOpacity(0.4),
                        theme.primaryColor.withOpacity(0.8),
                      ],
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: theme.secondaryHeaderColor.withOpacity(0.25),
                        blurRadius: 20,
                        spreadRadius: 2,
                      )
                    ],
                  ),

                  child: Icon(
                    widget.icon,
                    size: 42,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 18),

                /// TITLE
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 10),

                /// MESSAGE
                Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: isDark
                        ? Colors.grey.shade400
                        : Colors.grey.shade700,
                  ),
                ),

                const SizedBox(height: 22),

                /// RETRY BUTTON
                if (widget.onRetry != null)
                  GestureDetector(
                    onTap: widget.onRetry,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 12,
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),

                        gradient: LinearGradient(
                          colors: [
                            Colors.blueAccent,
                            Colors.purpleAccent,
                          ],
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.25),
                            blurRadius: 12,
                          ),
                        ],
                      ),

                      child: const Text(
                        "Try Again",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}