import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/videoplayer/video_player_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:video_player/video_player.dart';

class VideopreviewIntialize extends StatelessWidget {
  final VideoPlayerController videoPlayerController;
  const VideopreviewIntialize({super.key, required this.videoPlayerController});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VideoPlayerBloc, VideoPlayerState, bool>(
      selector: (state) {
        return state.isInitialized;
      },
      builder: (context, isIntialize) {
        return  Center(
          child: isIntialize? 
          AspectRatio(
            aspectRatio: videoPlayerController.value.aspectRatio,
            child: VideoPlayer(videoPlayerController),
          ):
          CustomException(title: 'Video Error',message: 'Controller intailization error!',)
        );
      },
    );
  }
}
