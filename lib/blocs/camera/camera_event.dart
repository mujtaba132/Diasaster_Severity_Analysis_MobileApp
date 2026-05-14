part of 'camera_bloc.dart';

class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object?> get props => [];
}

class OnPickPreDisasterImageEvent extends CameraEvent {}

class OnPickPostDisasterImageEvent extends CameraEvent {}

class OnStoreDataLocallyEvent extends CameraEvent {
  final File file;
  final File file2;
  const OnStoreDataLocallyEvent({required this.file, required this.file2});

  @override
  List<Object?> get props => [file, file2];
}

class OnUploadMediaEvent extends CameraEvent {
  final String filePath;
  const OnUploadMediaEvent({required this.filePath});

  @override
  List<Object?> get props => [filePath];
}

class OnSubmitRequestEvent extends CameraEvent {
  final String filePath;
  const OnSubmitRequestEvent({required this.filePath});

  @override
  List<Object?> get props => [filePath];
}

class OnGetSeverityEvent extends CameraEvent {
  final File file;
  final File file2;
  const OnGetSeverityEvent({required this.file, required this.file2});

  @override
  List<Object?> get props => [file, file2];
}
