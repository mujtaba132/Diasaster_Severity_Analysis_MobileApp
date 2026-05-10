import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatusCard({
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
      padding: EdgeInsets.all(width * .045),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),

        gradient: LinearGradient(
          colors:
              isDark
                  ? [
                    const Color(0xff111827),
                    const Color(0xff1F2937),
                  ]
                  : [
                    Colors.white,
                    theme.colorScheme.surface,
                  ],
        ),

        boxShadow: [
          BoxShadow(
            color:
                isDark
                    ? Colors.black.withOpacity(.18)
                    : Colors.grey.withOpacity(.08),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(width * .03),

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(.12),
            ),

            child: Icon(
              icon,
              color: color,
              size: width * .07,
            ),
          ),

          SizedBox(width: width * .035),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  value,

                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: width * .01),

                Text(
                  title,

                  style: TextStyle(
                    fontSize: width * .031,

                    color:
                        isDark
                            ? Colors.grey.shade400
                            : Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

