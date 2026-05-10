import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final String value;
  final Color? valueColor;

  const InfoTile({
    super.key, 
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Row(
      children: [

        Container(
          height: 42,
          width: 42,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.primaryColor
                .withOpacity(0.12),
          ),

          child: Icon(
            icon,
            color: theme.primaryColor,
            size: 21,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                title,

                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,

                  color: theme
                      .textTheme
                      .bodySmall!
                      .color!
                      .withOpacity(0.65),
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,

                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: valueColor ??
                      theme.textTheme.bodyLarge!.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}