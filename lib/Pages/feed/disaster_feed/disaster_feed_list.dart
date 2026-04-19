import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_card/disaster_feed_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fyp_project/config/routes/routes_arguments/imagePreview_arguments.dart';
import 'package:fyp_project/config/routes/routes_arguments/videoPreview_arguments.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/utils/enums.dart';

class DisasterFeedList extends StatelessWidget {
  
  final List<MediaModel> reports;
  final Role role;
  final MediaModel Function(BuildContext context, MediaModel model) selector;
  const DisasterFeedList({super.key,required this.reports,required this.role,required this.selector});

  @override
  Widget build(BuildContext context) {
        return AnimationLimiter(
  child: ListView.builder(
    itemCount: reports.length,
    itemBuilder: (context, index) {
      final report = reports[index];

      return AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50,
          child: FadeInAnimation(
            child: ReportCard(
              role: role,
              report: report,
              onTap: () {

                   if(report.mediaUrl!.endsWith(".mp4") || report.mediaUrl!.endsWith(".mov")){
                      Navigator.pushNamed(
                        context, 
                        RoutesName.videoPreviewScreen,
                        arguments: VideoPreviewArguments(file: File(report.mediaUrl!),
                        isNetworkVideo: true));
                   } else {
                      Navigator.pushNamed(
                      context, 
                      RoutesName.imagePreviewScreen,
                      arguments: ImagePreviewArguments(file: File(report.mediaUrl!),
                      isNetworkImage: true));
                   }
                   
              },
            ),
          ),
        ),
      );
    },
  )
    );
  }
}