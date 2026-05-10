import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final bool isAlert;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.isAlert = false,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: isDark
              ? [
                  const Color(0xff0F172A),
                  const Color(0xff1E293B),
                ]
              : [
                  Colors.white,
                  const Color(0xffF8FAFC),
                ],
        ),

        border: Border.all(
          color: color.withOpacity(.12),
          width: 1.2,
        ),

        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.08),
            blurRadius: 22,
            spreadRadius: 1,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              Container(
                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),

                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(.18),
                      color.withOpacity(.08),
                    ],
                  ),
                ),

                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),

              const Spacer(),

              if (isAlert)
                Container(
                  width: 12,
                  height: 12,

                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,

                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(.5),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                )
                    .animate(
                      onPlay: (controller) =>
                          controller.repeat(reverse: true),
                    )
                    .scale(
                      duration: 900.ms,
                      begin: const Offset(.8, .8),
                      end: const Offset(1.25, 1.25),
                    ),
            ],
          ),

          const Spacer(),

          Text(
            value,

            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: -.5,
              height: 1,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            title,

            maxLines: 2,
            overflow: TextOverflow.ellipsis,

            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,

              color: isDark
                  ? Colors.grey.shade400
                  : Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 14),

          Container(
            height: 5,
            width: 70,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              gradient: LinearGradient(
                colors: [
                  color,
                  color.withOpacity(.25),
                ],
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fade(duration: 450.ms)
        .slideX(begin: .12, end: 0);
  }
}