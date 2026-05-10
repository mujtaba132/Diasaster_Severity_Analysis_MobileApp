import 'package:flutter/material.dart';

class WideAnalyticsCard extends StatelessWidget {
  final String title;
  final String value;
  final String subTitle;
  final IconData icon;
  final Color color;

  const WideAnalyticsCard({
    super.key, 
    required this.title,
    required this.value,
    required this.subTitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(width * .05),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),

        gradient: LinearGradient(
          colors:
              isDark
                  ? [
                    const Color(0xff052e16),
                    const Color(0xff14532d),
                  ]
                  : [
                    color.withOpacity(.12),
                    color.withOpacity(.05),
                  ],
        ),

        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.18),
            blurRadius: 18,
            offset: const Offset(0, 10),
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
              size: width * .08,
            ),
          ),

          SizedBox(width: width * .04),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: width * .015),

                Text(
                  value,

                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),

                SizedBox(height: width * .01),

                Text(
                  subTitle,

                  style: TextStyle(
                    fontSize: width * .03,

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

