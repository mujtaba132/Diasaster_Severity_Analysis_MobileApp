import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  final VideoPlayerController _videoController;

  VideoPlayerBloc(this._videoController) : super(VideoPlayerState()) {
    on<OnInitailizeVideoEvent>(_onIntialize);
    on<OnPlayPauseVideoEvent>(_onPlayPause); 
    on<OnUpdatePositionEvent>(_onUpdatePosition);
    on<OnSeekVideoEvent>(_onSeekVideo);
  }

  
  Future<void> _onIntialize(OnInitailizeVideoEvent event , Emitter<VideoPlayerState> emit)async{

            await _videoController.initialize();
            emit(state.copyWith(
              newIsInitiallized: true,
              newDuration: _videoController.value.duration,
            ));

            _videoController.addListener((){
                   add(OnUpdatePositionEvent());
            });

  }


  void _onPlayPause(VideoPlayerEvent event,Emitter<VideoPlayerState> emit){
          
          if(_videoController.value.isPlaying){
            _videoController.pause();
          }
          else {
            _videoController.play();
          }

          emit(state.copyWith(
            newIsPlaying: _videoController.value.isPlaying,
          ));

  }


  void _onUpdatePosition(OnUpdatePositionEvent event,Emitter<VideoPlayerState> emit){
      
      final position = _videoController.value.position;
      final duration = _videoController.value.duration;

      final isCompleted = duration.inMilliseconds > 0 && position >= duration;

      if(isCompleted)
      {
        _videoController.seekTo(Duration.zero);
        _videoController.pause();
         emit(state.copyWith(
            newPosition: Duration.zero,
            newIsPlaying: false,
      ));
      }

      emit(state.copyWith(
            newPosition: position,
            newIsPlaying: _videoController.value.isPlaying,
      ));
      
  }

  void _onSeekVideo (OnSeekVideoEvent event, Emitter<VideoPlayerState> emit){
       _videoController.seekTo(event.position);
  }
  

  @override
  Future<void> close()
  {
    _videoController.dispose();
    return super.close();
  }

}
