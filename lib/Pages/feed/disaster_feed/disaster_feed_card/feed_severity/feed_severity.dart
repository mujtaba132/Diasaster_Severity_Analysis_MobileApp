import 'package:flutter/material.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/comments/citizen_feed_comments.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_card/feed_severity/feed_severity_dropdown.dart';
import 'package:fyp_project/utils/enums.dart';

class CardSeverity extends StatelessWidget {
  final MediaModel report;
  final Role role;

  const CardSeverity({super.key, required this.report, required this.role});

  Color _getSeverityColor() {
    switch (report.severity.toString().toLowerCase()) {
      case "major_damage":
        return Colors.redAccent;

      case "minor_damage":
        return Colors.orange;

      case "no_damage":
        return Colors.green;

      case "destroyed":
        return Colors.deepPurple;

      default:
        return Colors.blue;
    }
  }

  IconData _getSeverityIcon() {
    switch (report.severity.toString().toLowerCase()) {
      case "major_damage":
        return Icons.warning_amber_rounded;

      case "minor_damage":
        return Icons.error_outline_rounded;

      case "no_damage":
        return Icons.verified_rounded;

      case "destroyed":
        return Icons.dangerous_rounded;

      default:
        return Icons.crisis_alert_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final severityColor = _getSeverityColor();
    final severityIcon = _getSeverityIcon();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [const Color(0xff0F172A), const Color(0xff111827)]
              : [Colors.white, const Color(0xffF8FAFC)],
        ),

        border: Border.all(color: severityColor.withOpacity(0.18), width: 1.2),

        boxShadow: [
          BoxShadow(
            color: severityColor.withOpacity(isDark ? 0.22 : 0.12),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// LEFT ICON
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 58,
            width: 58,

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              gradient: LinearGradient(
                colors: [severityColor, severityColor.withOpacity(0.7)],
              ),

              boxShadow: [
                BoxShadow(
                  color: severityColor.withOpacity(0.35),
                  blurRadius: 14,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: Icon(severityIcon, color: Colors.white, size: 28),
          ),

          const SizedBox(width: 14),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// DISASTER TYPE
                Text(
                  report.disasterType ?? "Unknown Disaster",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    letterSpacing: 0.2,
                  ),
                ),

                const SizedBox(height: 8),

                /// SEVERITY BADGE
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: severityColor.withOpacity(0.12),
                    border: Border.all(color: severityColor.withOpacity(0.25)),
                  ),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(severityIcon, size: 14, color: severityColor),

                      const SizedBox(width: 5),

                      Text(
                        report.severity
                            .toString()
                            .replaceAll("_", " ")
                            .toUpperCase(),

                        style: TextStyle(
                          color: severityColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                /// TIME
                Row(
                  children: [
                    Icon(
                      Icons.access_time_filled_rounded,
                      size: 14,
                      color: theme.hintColor,
                    ),

                    const SizedBox(width: 5),

                    Expanded(
                      child: Text(
                        report.timeStamp ?? "",

                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.hintColor,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          /// RIGHT ACTIONS
          if (role == Role.admin)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(6),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue.withOpacity(0.08),
                border: Border.all(color: Colors.blue.withOpacity(0.15)),
              ),

              child: FeedSeverityDropdown(report: report),
            ),

          if (role == Role.citizen)
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => CommentSection(postId: report.reportId!),
                );
              },

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),

                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.green.shade400],
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.mode_comment_rounded,
                      color: Colors.white,
                      size: 18,
                    ),

                    SizedBox(width: 6),

                    Text(
                      "Comment",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
