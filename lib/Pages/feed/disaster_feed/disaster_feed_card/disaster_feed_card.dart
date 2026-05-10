import 'package:flutter/material.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_card/feed_media/feed_media_preview.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_card/feed_severity/feed_severity.dart';
import 'package:fyp_project/utils/enums.dart';

class ReportCard extends StatelessWidget {
  final MediaModel report;
  final VoidCallback onTap;
  final Role role;

  const ReportCard({
    super.key,
    required this.report,
    required this.onTap,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Hero(
      tag: report.reportId!,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: theme.cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.25 : 0.08),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
            
                /// ======================
                /// MEDIA SECTION (ONLY)
                /// ======================
                GestureDetector(
                  onTap: onTap,
                  child: Stack(
                    children: [
                
                      CardMediaPreview(
                        report: report,
                        role: role,
                      ),
                
                      /// ✅ SMALL SEVERITY BADGE (NOT FULL CARD)
                      Positioned(
                        bottom: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.55),
                            borderRadius: BorderRadius.circular(20),
                          ),
                
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                size: 16,
                                color: Colors.orange,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                report.severity.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            
                /// ======================
                /// DETAILS SECTION 
                /// ======================
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: CardSeverity(
                    report: report,
                    role: role,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}