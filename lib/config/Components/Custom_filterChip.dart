import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;
  final Color color;

  const CustomFilterChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 220),
        scale: isSelected ? 1.03 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: isSelected
                ? LinearGradient(colors: [color, color.withOpacity(0.78)])
                : LinearGradient(
                    colors: isDark
                        ? [const Color(0xff1F2937), const Color(0xff111827)]
                        : [Colors.white, const Color(0xffF3F4F6)],
                  ),
            border: Border.all(
              color: isSelected
                  ? color.withOpacity(0.8)
                  : theme.colorScheme.outline.withOpacity(0.12),
            ),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? color.withOpacity(0.22)
                    : Colors.black.withOpacity(isDark ? 0.18 : 0.04),
                blurRadius: isSelected ? 10 : 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? Colors.white.withOpacity(0.18)
                      : color.withOpacity(0.10),
                ),
                child: Icon(
                  icon,
                  size: 15,
                  color: isSelected ? Colors.white : color,
                ),
              ),

              const SizedBox(width: 6),

              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 220),
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                  fontSize: 11.5,
                  letterSpacing: 0.2,
                ),
                child: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
