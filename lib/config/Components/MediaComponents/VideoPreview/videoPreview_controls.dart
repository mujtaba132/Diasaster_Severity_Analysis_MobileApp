import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/videoplayer/video_player_bloc.dart';

class VideopreviewControls extends StatelessWidget {
  const VideopreviewControls({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocSelector<
      VideoPlayerBloc,
      VideoPlayerState,
      (Duration, Duration)
    >(
      selector: (state) => (state.duration, state.position),
      builder: (context, state) {
        final duration = state.$1;
        final position = state.$2;
        return Positioned(
          bottom: 55,
          left: 10,
          right: 10,
          child: Column(
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 4,
                  activeTrackColor: theme.primaryColor,
                  inactiveTrackColor: Colors.white24,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 7,
                  ),
                  thumbColor: theme.primaryColor,
                  overlayColor: theme.primaryColor.withOpacity(0.2),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 16,
                  ),

                  activeTickMarkColor: Colors.transparent,
                  inactiveTickMarkColor: Colors.transparent,
                ),

                child: Slider(
                  value: position.inSeconds.toDouble(),
                  max: duration.inSeconds == 0
                      ? 1
                      : duration.inSeconds.toDouble(),

                  onChanged: (value) {
                    context.read<VideoPlayerBloc>().add(
                      OnSeekVideoEvent(
                        position: Duration(seconds: value.toInt()),
                      ),
                    );
                  },
                ),
              ),

              //  TIMER
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _format(position),
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      _format(duration),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _format(Duration d) {
    final min = d.inMinutes.toString().padLeft(2, '0');
    final sec = (d.inSeconds % 60).toString().padLeft(2, '0');
    return "$min:$sec";
  }
}
