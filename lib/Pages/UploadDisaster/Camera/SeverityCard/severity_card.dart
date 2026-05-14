import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/camera/camera_bloc.dart';

class SeverityCard extends StatefulWidget {
  const SeverityCard({super.key});

  @override
  State<SeverityCard> createState() => _SeverityCardState();
}

class _SeverityCardState extends State<SeverityCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
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

    final screenWidth = MediaQuery.of(context).size.width;

    /// 🔥 Responsive sizes
    final isSmall = screenWidth < 360;
    final circleSize = isSmall ? 110.0 : 140.0;
    final titleSize = isSmall ? 15.0 : 17.0;
    final percentSize = isSmall ? 22.0 : 26.0;

    return BlocBuilder<CameraBloc, CamerasState>(
      buildWhen: (previous, current) =>
          current.severityPercentage != previous.severityPercentage ||
          current.severityLevel != previous.severityLevel,
      builder: (context, state) {
        if (state.severityPercentage == 0) {
          return const SizedBox.shrink();
        }

        final Color severityColor = getSeverityColor(state.severityLevel);

        return ScaleTransition(
          scale: _scale,

          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),

            width: double.infinity,

            padding: EdgeInsets.all(isSmall ? 14 : 20),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),

              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,

                colors: isDark
                    ? [
                        Colors.white.withOpacity(0.06),
                        Colors.white.withOpacity(0.02),
                      ]
                    : [Colors.white, const Color(0xffF8FAFC)],
              ),

              border: Border.all(color: severityColor.withOpacity(0.25)),

              boxShadow: [
                BoxShadow(
                  color: severityColor.withOpacity(0.18),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /// ================= HEADER =================
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(isSmall ? 10 : 12),

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        gradient: LinearGradient(
                          colors: [
                            severityColor.withOpacity(0.25),
                            severityColor.withOpacity(0.08),
                          ],
                        ),
                      ),

                      child: Icon(
                        Icons.insights_rounded,
                        color: severityColor,
                        size: isSmall ? 22 : 26,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        "Severity Analysis",

                        overflow: TextOverflow.ellipsis,

                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: titleSize,
                        ),
                      ),
                    ),

                    /// Badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmall ? 10 : 14,
                        vertical: isSmall ? 4 : 6,
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        gradient: LinearGradient(
                          colors: [
                            severityColor,
                            severityColor.withOpacity(0.7),
                          ],
                        ),
                      ),

                      child: Text(
                        state.severityLevel,

                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isSmall ? 11 : 13,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: isSmall ? 16 : 25),

                /// ================= CIRCLE =================
                Center(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: state.severityPercentage),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOutCubic,

                    builder: (context, value, child) {
                      return Stack(
                        alignment: Alignment.center,

                        children: [
                          SizedBox(
                            height: circleSize,
                            width: circleSize,

                            child: CircularProgressIndicator(
                              value: value,
                              strokeWidth: isSmall ? 10 : 12,

                              backgroundColor: isDark
                                  ? Colors.white12
                                  : Colors.grey.shade200,

                              valueColor: AlwaysStoppedAnimation<Color>(
                                severityColor,
                              ),
                            ),
                          ),

                          Column(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              Text(
                                "${(value).toInt()}%",

                                style: TextStyle(
                                  fontSize: percentSize,
                                  fontWeight: FontWeight.w900,
                                  color: severityColor,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                "Risk Level",

                                style: TextStyle(
                                  fontSize: isSmall ? 10 : 12,
                                  color: isDark
                                      ? Colors.white70
                                      : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),

                SizedBox(height: isSmall ? 14 : 20),

                /// ================= STATUS =================
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmall ? 12 : 16,
                      vertical: isSmall ? 8 : 10,
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: severityColor.withOpacity(0.08),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Icon(
                          getSeverityIcon(state.severityLevel),
                          size: isSmall ? 16 : 18,
                          color: severityColor,
                        ),

                        const SizedBox(width: 8),

                        Flexible(
                          child: Text(
                            _getSeverityMessage(state.severityLevel),

                            overflow: TextOverflow.ellipsis,

                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: severityColor,
                              fontSize: isSmall ? 12 : 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// ================= COLORS =================
  Color getSeverityColor(String severity) {
    switch (severity) {
      case "no_damage":
        return Colors.green;
      case "minor_damage":
        return Colors.orange;
      case "major_damage":
        return Colors.red;
      case "destroyed":
        return Colors.deepPurple;
      default:
        return Colors.red;
    }
  }

  /// ================= ICONS =================
  IconData getSeverityIcon(String severity) {
    switch (severity) {
      case "no_damage":
        return Icons.verified_rounded; // safe / good

      case "minor_damage":
        return Icons.warning_amber_rounded; // caution

      case "major_damage":
        return Icons.gpp_bad_rounded; // serious damage

      case "destroyed":
        return Icons.dangerous_rounded; // critical

      default:
        return Icons.help_outline_rounded;
    }
  }

  /// ================= MESSAGE =================
  String _getSeverityMessage(String severity) {
    switch (severity) {
      case "Low":
        return "Safe Condition";
      case "Medium":
        return "Moderate Risk";
      default:
        return "High Danger";
    }
  }
}
