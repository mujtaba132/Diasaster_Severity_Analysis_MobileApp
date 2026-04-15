part of 'video_player_bloc.dart';


sealed class VideoPlayerEvent extends Equatable {

  const  VideoPlayerEvent();

  @override
  List<Object> get props => [];

}

class OnInitailizeVideoEvent extends VideoPlayerEvent{}

class OnPlayPauseVideoEvent extends VideoPlayerEvent{}

class OnUpdatePositionEvent extends VideoPlayerEvent{}

class OnSeekVideoEvent extends VideoPlayerEvent{
    final Duration position;

    const OnSeekVideoEvent({required this.position});

    @override
    List<Object> get props => [position];
}


