part of 'camera_bloc.dart';

class CamerasState extends Equatable{

  final File? captureFile;
  final String videoThumbnail;
  final MediaUploadStatus mediaUploadStatus;
  final SubmitRequestStatus submitRequestStatus;
  final String address;
  final String error;
  const CamerasState({
      this.captureFile,
      this.videoThumbnail = '',
      this.mediaUploadStatus = MediaUploadStatus.initail,
      this.submitRequestStatus = SubmitRequestStatus.initail,
      this.address='',
      this.error = '',
  });
    

  CamerasState copyWith({
       File? newCaptureFile,
       String? newVideoThumnail,
       MediaUploadStatus? newMediaUploadStatus,
       SubmitRequestStatus? newSubmitRequestStatus,
       String? newAddress,
       String? newError,
  }){
     return CamerasState(
         captureFile: newCaptureFile ?? captureFile,
         videoThumbnail: newVideoThumnail ?? videoThumbnail,
         mediaUploadStatus: newMediaUploadStatus ?? mediaUploadStatus,
         submitRequestStatus: newSubmitRequestStatus ?? submitRequestStatus,
         address: newAddress  ?? address,
         error: newError ?? error,
     );
  }

  @override
  List<Object?> get props => [captureFile,videoThumbnail,mediaUploadStatus,submitRequestStatus,address,error];
}
