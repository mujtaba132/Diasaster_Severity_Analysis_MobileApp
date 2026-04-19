import 'package:flutter/material.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_card/feed_severity/feed_severity_dropdown.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_card/feed_severity/feed_severity_indicator.dart';
import 'package:fyp_project/utils/enums.dart';

class CardSeverity extends StatelessWidget {

  final MediaModel report;
  final Role role;
  const CardSeverity({super.key,required this.report,required this.role});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  Padding(
  padding: const EdgeInsets.all(0),
  child: Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: theme.cardColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 12,
          offset: const Offset(0, 6),
        )
      ],
    ),
    child: Row(
      children: [

        // Circular Severity Indicator
       AnimatedSeverityIndicator(
             severity: report.severity!
             ),

        const SizedBox(width: 24),

        // Info Section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Disaster Type
              Text(
                report.disasterType!,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis
                ),
              ),

              const SizedBox(height: 5),

              // Subtitle
              Text(
                report.location!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.hintColor,
                  overflow: TextOverflow.ellipsis
                ),
              ),

              const SizedBox(height: 8),

              // TimeStamp
              Text(
                report.timeStamp!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.hintColor,
                  fontSize: 10,
                  overflow: TextOverflow.ellipsis
                ),
              ),

              
            ],
          ),
        ),

        const SizedBox(width: 20),
        
         role == Role.admin?
         FeedSeverityDropdown(report: report)
         :const SizedBox.shrink()
      ],
    ),
  ),
);
  }
}