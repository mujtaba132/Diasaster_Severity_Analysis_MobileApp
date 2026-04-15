part of 'camera_bloc.dart';

class CameraEvent extends Equatable {

  const CameraEvent();
  
  @override
  List<Object?> get props => [];
}


class OnCaptureMediaEvent extends CameraEvent {
      final MediaCapture mediaCapture;
      const OnCaptureMediaEvent({required this.mediaCapture});

      @override
      List<Object?> get props => [mediaCapture];
}   

class OnPickedMediaEvent extends CameraEvent {}


class OnUploadMediaEvent extends CameraEvent {
    final String filePath;
    const OnUploadMediaEvent({required this.filePath});

    @override
    List<Object?> get props => [filePath];
}


class OnSubmitRequestEvent extends CameraEvent{
  final String filePath;
    const OnSubmitRequestEvent({required this.filePath});

    @override
    List<Object?> get props => [filePath];
}