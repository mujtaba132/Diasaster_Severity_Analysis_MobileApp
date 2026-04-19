import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideopreviewIntialize extends StatelessWidget {
  final VideoPlayerController videoPlayerController;
  const VideopreviewIntialize({super.key, required this.videoPlayerController});

  @override
  Widget build(BuildContext context) {
    return  Center(
          child: AspectRatio(
            aspectRatio: videoPlayerController.value.aspectRatio,
            child: VideoPlayer(videoPlayerController),
          ));
  }
}
