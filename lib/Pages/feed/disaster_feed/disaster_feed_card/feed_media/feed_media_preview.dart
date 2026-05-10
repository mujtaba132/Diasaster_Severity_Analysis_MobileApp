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

  const CardMediaPreview({
    super.key,
    required this.report,
    required this.role,
  });

  bool isVideo(String url) {
    return url.endsWith(".mp4") || url.endsWith(".mov");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),

        child: Stack(
          children: [

            /// 📸 MEDIA
            isVideo(report.mediaUrl!)
                ? CustomNetworkimage(
                    imageUrl: report.videoThumbnail!,
                    height: 270,
                    borderRadius: 0,
                    errorText: 'Thumbnail not found',
                  )
                : CustomNetworkimage(
                    imageUrl: report.mediaUrl!,
                    height: 270,
                    borderRadius: 0,
                  ),

            /// 🌫 DARK OVERLAY (for readability)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.15),
                      Colors.black.withOpacity(0.75),
                    ],
                  ),
                ),
              ),
            ),

            /// 🫧 SOFT GLASS BLUR (subtle premium feel)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Container(color: Colors.transparent),
              ),
            ),

            /// 👤 USER HEADER (TOP LEFT)
            Positioned(
              top: 12,
              left: 12,
              child: AnimatedProfileHeader(
                imageUrl: report.userProfileUrl!,
              ),
            ),


            /// ▶ PLAY BUTTON (VIDEO ONLY)
            if (isVideo(report.mediaUrl!))
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.12),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 20,
                        )
                      ],
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}