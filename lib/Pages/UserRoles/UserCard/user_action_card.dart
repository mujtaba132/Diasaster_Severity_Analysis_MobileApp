import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final bool isDark;
  final IconData icon;
  final String title;
  final String subTitle;
  final Color color;
  final ThemeData theme;

  const ActionCard({
    super.key, 
    required this.isDark,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * .035,
        vertical: width * .035,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors:
              isDark
                  ? [
                    Colors.white.withOpacity(.04),
                    Colors.white.withOpacity(.02),
                  ]
                  : [
                    theme.colorScheme.primary.withOpacity(0.06),
                    theme.colorScheme.primary.withOpacity(.04),
                  ],
        ),
      ),

      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(width * .025),

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(.12),
            ),

            child: Icon(
              icon,
              color: color,
              size: width * .055,
            ),
          ),

          SizedBox(width: width * .03),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  overflow: TextOverflow.ellipsis,

                  style: theme.textTheme.bodySmall?.copyWith(
                    color:
                        isDark
                            ? Colors.grey.shade400
                            : Colors.grey.shade700,
                  ),
                ),

                SizedBox(height: width * .01),

                Text(
                  subTitle,

                  overflow: TextOverflow.ellipsis,

                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: width * .035,
                  ),
                ),
              ],
            ),
          ),

           Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(230, 67, 62, 208),
                          const Color.fromARGB(255, 13, 103, 187),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
        ],
      ),
    );
  }
}