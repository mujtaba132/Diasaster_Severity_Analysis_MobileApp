import 'package:flutter/material.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/comments/citizen_feed_comments.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_card/feed_severity/feed_severity_dropdown.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_card/feed_severity/feed_severity_indicator.dart';
import 'package:fyp_project/utils/enums.dart';

class CardSeverity extends StatelessWidget {
  final MediaModel report;
  final Role role;

  const CardSeverity({
    super.key,
    required this.report,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),

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
            color: Colors.black.withOpacity(isDark ? 0.25 : 0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        children: [

          // /// 🔥 SEVERITY INDICATOR (LEFT)
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Colors.red.withOpacity(0.08),
          //   ),
          //   child: AnimatedSeverityIndicator(
          //     severity: report.severity!,
          //   ),
          // ),

          const SizedBox(width: 14),

          /// 📄 MAIN INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// TITLE + ICON
                Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 18,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        report.disasterType!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// LOCATION
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        report.location!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.hintColor,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// TIME
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),

                    Text(
                      report.timeStamp!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.hintColor,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          /// ACTIONS
          Column(
            children: [

              /// ADMIN ACTION
              if (role == Role.admin)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FeedSeverityDropdown(report: report),
                ),

              /// CITIZEN ACTION
              if (role == Role.citizen)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => CommentSection(
                          postId: report.reportId!,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.comment_rounded,
                      size: 18,
                    ),
                    label: const Text("Comment"),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}