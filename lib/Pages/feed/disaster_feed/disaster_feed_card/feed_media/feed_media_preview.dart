import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_card/feed_media/feed_media_header.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_card/feed_media/feed_media_status.dart';
import 'package:fyp_project/config/Components/Custom_NetworkImage.dart';
import 'package:fyp_project/utils/enums.dart';

class CardMediaPreview extends StatelessWidget {

  final MediaModel report;
  final Role role;
  const CardMediaPreview({super.key,required this.report,required this.role});

    bool isVideo(String url) {
    return url.endsWith(".mp4") || url.endsWith(".mov");
  }

  @override
  Widget build(BuildContext context) {
    return     Stack(
  children: [

    // Media
     isVideo(report.mediaUrl!)?
      CustomNetworkimage(
      imageUrl: report.videoThumbnail!,
      height: 270,
      borderRadius: 0,
      errorText: 'Thumbnail not found',)
     : CustomNetworkimage(
      imageUrl: report.mediaUrl!,
      height: 270,
      borderRadius: 0),

    //  Blur Effect
    Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(color: Colors.transparent),
      ),
    ),

    //  Gradient Overlay
    Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    ),

    Positioned(
      top: 10,
      left: 12,
      child:
      AnimatedProfileHeader(
        imageUrl: report.userProfileUrl!) 
    ),

    
    FeedMediaStatus(status: report.status!,role: role),

    //  Video Icon
    if (isVideo(report.mediaUrl!))
      const Positioned.fill(
        child: Center(
          child: Icon(Icons.play_circle_rounded, size: 60, color: Colors.white),
        ),
      ),
  ]);
  }


}