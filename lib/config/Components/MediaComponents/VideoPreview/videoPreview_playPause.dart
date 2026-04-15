import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/videoplayer/video_player_bloc.dart';

class VideopreviewPlaypause extends StatelessWidget {
  const VideopreviewPlaypause({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocSelector<VideoPlayerBloc, VideoPlayerState, bool>(
      selector: (state) {
        return state.isPlaying;
      },
      builder: (context, state) {
        return ModernPlayButton(
          isPlaying: state, 
          onTap: ()=> context.read<VideoPlayerBloc>().add(OnPlayPauseVideoEvent()));
      },
    );
  }
}

class ModernPlayButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onTap;

  const ModernPlayButton({
    super.key,
    required this.isPlaying,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.4), // glass effect
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),

        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),

          child: Icon(
            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            key: ValueKey(isPlaying),
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}