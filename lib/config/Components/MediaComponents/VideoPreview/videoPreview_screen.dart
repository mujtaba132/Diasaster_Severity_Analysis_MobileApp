import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/videoplayer/video_player_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Appbar.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/config/Components/MediaComponents/VideoPreview/videoPreview_controls.dart';
import 'package:fyp_project/config/Components/MediaComponents/VideoPreview/videoPreview_intialize.dart';
import 'package:fyp_project/config/Components/MediaComponents/VideoPreview/videoPreview_playPause.dart';
import 'package:fyp_project/utils/enums.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  final File filePath;
  final bool isNetworkVideo;

  const VideoPreviewScreen({
    super.key,
    required this.filePath,
    required this.isNetworkVideo,
  });

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late VideoPlayerBloc _videoPlayerBloc;
  late VideoPlayerController _videoPlayercontroller;

  @override
  void initState() {
    super.initState();

    !widget.isNetworkVideo
        ? _videoPlayercontroller = VideoPlayerController.file(widget.filePath)
        : _videoPlayercontroller = VideoPlayerController.networkUrl(
            Uri.parse(widget.filePath.path),
          );

    _videoPlayerBloc = VideoPlayerBloc(_videoPlayercontroller)
      ..add(OnInitailizeVideoEvent());
  }

  @override
  void dispose() {
    _videoPlayerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider.value(
      value: _videoPlayerBloc,
      child: Scaffold(
        appBar: CustomAppbar(title: widget.filePath.uri.pathSegments.last),
        backgroundColor: Colors.black,
        body: BlocSelector<VideoPlayerBloc, VideoPlayerState, VideoInitializingStatus>(
          selector: (state) {
            return state.videoInitializingStatus;
          },
          builder: (context, videoInitializingStatus) {

            if(videoInitializingStatus == VideoInitializingStatus.error)
            {
              return Center(child: CustomException(message: "Video initialization error..."));
            } else if(videoInitializingStatus == VideoInitializingStatus.loading)
            {
              return Center(child: CustomLoading(color: theme.primaryColor));
            }

            return SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // VIDEO
                  VideopreviewIntialize(
                    videoPlayerController: _videoPlayercontroller,
                  ),

                  // PLAY / PAUSE
                  VideopreviewPlaypause(),

                  //Controls
                  VideopreviewControls(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
