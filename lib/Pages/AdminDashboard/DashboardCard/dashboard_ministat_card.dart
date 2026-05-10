
import 'package:flutter/material.dart';

class MiniStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const MiniStatCard({
    super.key, 
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * .03,
        vertical: width * .04,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),

        color:
            isDark
                ? Colors.white.withOpacity(.04)
                : Colors.white,

        boxShadow: [
          BoxShadow(
            color:
                isDark
                    ? Colors.black.withOpacity(.15)
                    : Colors.grey.withOpacity(.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: width * .06,
          ),

          SizedBox(height: width * .02),

          Text(
            value,

            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: width * .01),

          Text(
            title,

            style: TextStyle(
              fontSize: width * .028,

              color:
                  isDark
                      ? Colors.grey.shade400
                      : Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
