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

    return Hero(
      tag: report.reportId!,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: theme.cardColor,
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
                  // MEDIA PREVIEW          
            GestureDetector(
              onTap: onTap,
              child: CardMediaPreview(report: report,role: role)),
    
                 // CONTENT                     
            CardSeverity(report: report,role: role),
    
          ]),   
      ),
    );
  }


 
}

