part of 'video_player_bloc.dart';


class VideoPlayerState extends  Equatable{
 
  final bool isInitialized;
  final bool isPlaying;
  final Duration position;
  final Duration duration;
  final VideoInitializingStatus videoInitializingStatus;

  const VideoPlayerState({
       this.isInitialized = false,
       this.isPlaying = false,
       this.position = Duration.zero,
       this.duration = Duration.zero,
       this.videoInitializingStatus = VideoInitializingStatus.initail
  });


  VideoPlayerState copyWith ({
          bool? newIsInitiallized,
          bool? newIsPlaying,
          Duration? newPosition,
          Duration? newDuration,
          VideoInitializingStatus? newVideoInitialStatus})
  {
     return VideoPlayerState(
      isInitialized: newIsInitiallized ?? isInitialized,
      isPlaying: newIsPlaying ?? isPlaying, 
      position: newPosition ?? position, 
      duration: newDuration ?? duration,
      videoInitializingStatus: newVideoInitialStatus ?? videoInitializingStatus);
  }
  
  @override
  List<Object?> get props => [isInitialized,videoInitializingStatus,isPlaying,position,duration];

}
