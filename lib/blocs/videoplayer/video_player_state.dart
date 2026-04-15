part of 'video_player_bloc.dart';


class VideoPlayerState extends  Equatable{
 
  final bool isInitialized;
  final bool isPlaying;
  final Duration position;
  final Duration duration;

  const VideoPlayerState({
       this.isInitialized = false,
       this.isPlaying = false,
       this.position = Duration.zero,
       this.duration = Duration.zero,
  });


  VideoPlayerState copyWith ({
          bool? newIsInitiallized,
          bool? newIsPlaying,
          Duration? newPosition,
          Duration? newDuration})
  {
     return VideoPlayerState(
      isInitialized: newIsInitiallized ?? isInitialized,
      isPlaying: newIsPlaying ?? isPlaying, 
      position: newPosition ?? position, 
      duration: newDuration ?? duration);
  }
  
  @override
  List<Object?> get props => [isInitialized,isPlaying,position,duration];

}
