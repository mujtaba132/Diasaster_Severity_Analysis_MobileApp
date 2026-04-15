import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/videoplayer/video_player_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Appbar.dart';
import 'package:fyp_project/config/Components/MediaComponents/VideoPreview/videoPreview_controls.dart';
import 'package:fyp_project/config/Components/MediaComponents/VideoPreview/videoPreview_intialize.dart';
import 'package:fyp_project/config/Components/MediaComponents/VideoPreview/videoPreview_playPause.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  final File file;

  const VideoPreviewScreen({super.key, required this.file});

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late VideoPlayerBloc _videoPlayerBloc;
  late VideoPlayerController _videoPlayercontroller;

  @override
  void initState() {
    super.initState();
    _videoPlayercontroller=VideoPlayerController.file(widget.file);
    _videoPlayerBloc=VideoPlayerBloc(_videoPlayercontroller)..add(OnInitailizeVideoEvent());
  }


  @override
  void dispose() {
    _videoPlayerBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    

    return BlocProvider.value(
      value: _videoPlayerBloc,
      child: Scaffold(
        appBar: CustomAppbar(title: widget.file.uri.pathSegments.last),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
                alignment: Alignment.center,
                children: [

                  // VIDEO
                  VideopreviewIntialize(videoPlayerController: _videoPlayercontroller),

                  // PLAY / PAUSE
                  VideopreviewPlaypause(),

                  //Controls
                  VideopreviewControls(),

                ],
              )
        ),
      ),
    );
  }

 
}