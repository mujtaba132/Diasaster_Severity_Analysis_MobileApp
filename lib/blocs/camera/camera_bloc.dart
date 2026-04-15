import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/repository/cloudinary_repository/cloudinaryRepository.dart';
import 'package:fyp_project/repository/media_repository/submit_media_repository.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/repository/media_repository/pickMediaRepository.dart';
import 'package:fyp_project/repository/media_repository/uploadMediaRepository.dart';
import 'package:fyp_project/utils/enums.dart';
import 'package:geolocator/geolocator.dart';

part 'camera_event.dart';
part 'camera_state.dart';


class CameraBloc extends Bloc<CameraEvent, CamerasState> {

  PickMediaRepository pickMediaRepository;
  UploadMediaRepository uploadMediaRepository;
  Cloudinaryrepository cloudinaryrepository;
  FirebaseRepository firebaseRepository;
  SubmitMediaRepository submitMediaRepository;

  CameraBloc(
    this.pickMediaRepository,
    this.uploadMediaRepository,
    this.cloudinaryrepository,
    this.firebaseRepository,
    this.submitMediaRepository):
    super(CamerasState()) {
    on<OnCaptureMediaEvent>(_onCaptureMedia);
    on<OnPickedMediaEvent>(_onPickMedia);
    on<OnUploadMediaEvent>(_onUploadMedia);
    on<OnSubmitRequestEvent>(_onSubmitRequest);
  }


   void _onCaptureMedia(OnCaptureMediaEvent event,Emitter<CamerasState> emit)
   {
        emit(state.copyWith(newError: ''));

        if(event.mediaCapture.status == MediaCaptureStatus.success)
        {
            CaptureRequest captureMedia = event.mediaCapture.captureRequest;

            if(captureMedia.path == null) return;
   
            final String filePath = captureMedia.path!;
            emit(state.copyWith(newCaptureFile: File(filePath)));
        } 
        else if(event.mediaCapture.status == MediaCaptureStatus.failure){

             emit(state.copyWith(newError: 'Something went wrong while capturing the media.'));
        }
   }

   void _onPickMedia(OnPickedMediaEvent event,Emitter<CamerasState> emit)
   async{

        emit(state.copyWith(newError: ''));

        await pickMediaRepository.pickDeviceMedia().then((filePath) {
                 emit(state.copyWith(newCaptureFile: File(filePath!)));   
        }).onError((error, stackTrace) {
                 emit(state.copyWith(newError: error.toString())); 
        });

   }

   void _onUploadMedia(OnUploadMediaEvent event,Emitter<CamerasState> emit) async{

        emit(state.copyWith(newError: '',newMediaUploadStatus: MediaUploadStatus.loading));

       try{
           String? uploadMediaUri;
           Position position = await uploadMediaRepository.getCurrentLocation();
           String address = await uploadMediaRepository.getAddress(position: position);           
           emit(state.copyWith(newAddress: address)); 

           String filePath = event.filePath;
           if(filePath.endsWith('mp4') || filePath.endsWith('mov')) {
              uploadMediaUri = await cloudinaryrepository.uploadCloudinaryVideo(filePath: filePath);
           } else {
              uploadMediaUri = await cloudinaryrepository.uploadCloudinaryImage(filePath: filePath);
           }
           
            emit(state.copyWith(newCaptureFile: File(uploadMediaUri!),newMediaUploadStatus: MediaUploadStatus.success)); 

       } catch (error){
              emit(state.copyWith(newError: error.toString(),newMediaUploadStatus: MediaUploadStatus.error)); 
       }
        
   }


   void _onSubmitRequest(OnSubmitRequestEvent event,Emitter<CamerasState> emit) async{

       if(state.captureFile == null)  
       {
        emit(state.copyWith(newError: 'Upload file before submit.',newSubmitRequestStatus: SubmitRequestStatus.error));
        return;
       }
       emit(state.copyWith(newError: '',newSubmitRequestStatus: SubmitRequestStatus.loading));
       
       try{

            MediaModel mediaModel = await submitMediaRepository.getMediaSeverity(filePath: event.filePath);
            MediaModel updatedModel = mediaModel.copyWith(location: state.address,mediaUrl: state.captureFile!.path);
            String currentUser = FirebaseAuth.instance.currentUser!.uid;

            await firebaseRepository.pushUserMediaData(userId: currentUser,data: updatedModel.toJson());
            emit(state.copyWith(newSubmitRequestStatus: SubmitRequestStatus.success));

       } catch (error){
           emit(state.copyWith(newError: error.toString(),newSubmitRequestStatus: SubmitRequestStatus.error));
       }

   }
}
