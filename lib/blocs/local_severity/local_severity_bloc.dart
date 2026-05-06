import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/repository/cloudinary_repository/cloudinaryRepository.dart';
import 'package:fyp_project/repository/current_user_repository/current_user_repository.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/repository/sqlLite_media_repository/sqllite_media_repository.dart';
import 'package:fyp_project/utils/enums.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'local_severity_event.dart';
part 'local_severity_state.dart';

class LocalSeverityBloc extends Bloc<LocalSeverityEvent, LocalSeverityState> {
  final SQLLiteMediaRepository sqlLiteMediaRepository;
  final Cloudinaryrepository cloudinaryrepository ;
  final FirebaseRepository firebaseRepository;
  final CurrentUserRepository currentUserRepository;
  LocalSeverityBloc(
    this.sqlLiteMediaRepository,
    this.cloudinaryrepository,
    this.firebaseRepository,
    this.currentUserRepository) : super(LocalSeverityState()) {
    on<OnLoadLocalSeverityEvent>(_onloadLocalData);
    on<OnDeleteLocalSeverityEvent>(_onDeleteLocalData);
    on<OnUploadMediaEvent>(_onUploadMedia);
    on<OnSubmitRequestEvent>(_onSubmitRequest);
    on<OnSearchLocalSeverityEvent>(_onSearchLocalData);
  }

  void _onloadLocalData(OnLoadLocalSeverityEvent event, Emitter<LocalSeverityState> emit) async{
      
           emit(state.copyWith(newError: '',newLocalServerityStatus: LocalSeverityStatus.loading));
              
           await sqlLiteMediaRepository.getMediaList().then((data) {
                 final map = {for(var item in data)  item.reportId! : item};
                 emit(state.copyWith(
                    newLocalServerityStatus: LocalSeverityStatus.success,
                    newlocalData: data,
                    newSearchLocalData: data,
                    newLocalMap: map));   
           }).onError((error, stackTrace) {
              emit(state.copyWith(newLocalServerityStatus: LocalSeverityStatus.error,newError: error.toString())); 
           });     

  }

  void _onSearchLocalData(OnSearchLocalSeverityEvent event,Emitter<LocalSeverityState> emit){
          
          emit(state.copyWith(newError: '',newLocalServerityStatus: LocalSeverityStatus.loading));
          
          String query = event.query.toLowerCase();

          List<MediaModel> updatedList = 
          state.localData.where((element) { 
            return
            element.disasterType!.toLowerCase().contains(query);}).toList();

          print(updatedList);
          emit(state.copyWith(
            newLocalServerityStatus: LocalSeverityStatus.success,
            newSearchLocalData: updatedList,
            newSearchQuery: query));

  }

   void _onDeleteLocalData(OnDeleteLocalSeverityEvent event, Emitter<LocalSeverityState> emit) async{
         
       emit(state.copyWith(newError: ''));
       List<MediaModel> updatedList = 
       state.localData.where((element) => element.reportId!=event.reportId).toList();

       emit(state.copyWith(newlocalData: updatedList));

       await sqlLiteMediaRepository.deleteData(event.reportId).onError((error, stackTrace) {
           emit(state.copyWith(newError: error.toString()));
       });

   }


   void _onUploadMedia(OnUploadMediaEvent event,Emitter<LocalSeverityState> emit) async{

        emit(state.copyWith(newError: '',newMediaUploadStatus: MediaUploadStatus.loading));

       try{
           String? locationMediaUri;
           String filePath = event.file.path;

           if(filePath.endsWith('mp4') || filePath.endsWith('mov')) {

              String? videoThumbnail = await VideoThumbnail.thumbnailFile(video: filePath);
              String? uploadThumbnail = await cloudinaryrepository.uploadCloudinaryImage(filePath: videoThumbnail!);
              locationMediaUri = await cloudinaryrepository.uploadCloudinaryVideo(filePath: filePath);
              emit(state.copyWith(newUploadThumbnail: uploadThumbnail));

           } else {
              locationMediaUri = await cloudinaryrepository.uploadCloudinaryImage(filePath: filePath);
           }
           
            emit(state.copyWith(newUploadMediaUrl: locationMediaUri,newMediaUploadStatus: MediaUploadStatus.success)); 

       } catch (error){
              emit(state.copyWith(newError: error.toString(),newMediaUploadStatus: MediaUploadStatus.error)); 
       }
        
   }


   void _onSubmitRequest(OnSubmitRequestEvent event,Emitter<LocalSeverityState> emit) async{

       if(state.uploadMediaUrl.isEmpty)  
       {
        emit(state.copyWith(newError: 'Upload file before submit.',newSubmitRequestStatus: SubmitRequestStatus.error));
        return;
       }
       emit(state.copyWith(newError: '',newSubmitRequestStatus: SubmitRequestStatus.loading));
       
       try{

              MediaModel updatedModel = event.model.copyWith(
              userName: currentUserRepository.userName(),
              userToken: currentUserRepository.userId(),
              userProfileUrl: currentUserRepository.userProfileUrl(),
              mediaUrl: state.uploadMediaUrl,
              videoThumbnail: state.uploadThumbnail);
 

            await firebaseRepository.setData(collectionPath: "UsersMedia",docpath: updatedModel.reportId!, data : updatedModel.toJson());
            emit(state.copyWith(newSubmitRequestStatus: SubmitRequestStatus.success));

       } catch (error){
           emit(state.copyWith(newError: error.toString(),newSubmitRequestStatus: SubmitRequestStatus.error));
       }

   }


}



 




