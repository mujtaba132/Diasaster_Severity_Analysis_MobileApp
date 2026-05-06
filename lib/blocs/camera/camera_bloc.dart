import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/repository/media_repository/pickMediaRepository.dart';
import 'package:fyp_project/repository/media_repository/mediaLocationRepository.dart';
import 'package:fyp_project/repository/model_predict_repository/model_predict_repository.dart';
import 'package:fyp_project/repository/sqlLite_media_repository/sqllite_media_repository.dart';
import 'package:fyp_project/utils/enums.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'camera_event.dart';
part 'camera_state.dart';


class CameraBloc extends Bloc<CameraEvent, CamerasState> {
  
  final uuid = Uuid();

  PickMediaRepository pickMediaRepository;
  MediaLocationRepository locationMediaRepository;
  SQLLiteMediaRepository sqlLiteMediaRepository;
  ModelPredictRepository modelPredictRepository;

  CameraBloc(
    this.pickMediaRepository,
    this.locationMediaRepository,
    this.sqlLiteMediaRepository,
    this.modelPredictRepository):
    super(CamerasState()) {
    on<OnCaptureMediaEvent>(_onCaptureMedia);
    on<OnPickedMediaEvent>(_onPickMedia);
    on<OnStoreDataLocallyEvent>(_onSaveDataLocally);
    on<OnLoadPredictModelEvent>(_onLoadPredictModel);
  }

   void _onLoadPredictModel(OnLoadPredictModelEvent event,Emitter<CamerasState> emit) async{
        
        await modelPredictRepository.loadModel();
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

   void _onSaveDataLocally(OnStoreDataLocallyEvent event,Emitter<CamerasState> emit) async{
        
      if(event.file.path.isEmpty)  
       {
        emit(state.copyWith(newError: 'Select file before get severity.',newSubmitRequestStatus: SubmitRequestStatus.error));
        return;
       }
       emit(state.copyWith(newError: '',newSubmitRequestStatus: SubmitRequestStatus.loading));
         final filePath = event.file.path;
          Map<String,dynamic> map;

        try{
             Position position = await locationMediaRepository.getCurrentLocation();
             String address = await locationMediaRepository.getAddress(position: position);  

             String mediaPath = await sqlLiteMediaRepository.storeFile(event.file);  

             String currentDateTime = DateFormat("dd MMM yyyy 'At' hh:mm a").format(DateTime.now()); 

             if(filePath.endsWith('mp4') || filePath.endsWith('mov'))
             {  
               map = await modelPredictRepository.predictVideo(File(filePath));
             } else {
               map = modelPredictRepository.predictImage(File(filePath));
             }  
                       

             final model = MediaModel(
              reportId: uuid.v4(),
              location: address,
              disasterType: map['class'],
              severity: double.tryParse(map['confidence']),
              mediaUrl: mediaPath,
              timeStamp: currentDateTime,
              status: CitizenFeedStatus.pending, 
             ); 
          
             await sqlLiteMediaRepository.insertData(model);  
             emit(state.copyWith(newSubmitRequestStatus: SubmitRequestStatus.success));

        } catch (e){ 
           emit(state.copyWith(newError: e.toString(),newSubmitRequestStatus: SubmitRequestStatus.error)); 
        }


   }
   }
