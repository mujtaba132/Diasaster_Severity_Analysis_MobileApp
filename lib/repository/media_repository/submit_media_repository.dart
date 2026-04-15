import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:fyp_project/data/networks/network_services_api.dart';
import 'package:dio/dio.dart';

class SubmitMediaRepository {
      
    final NetworkServicesApi _networkServicesApi = NetworkServicesApi();


    Future<MediaModel> getMediaSeverity ({required String filePath}) async{
            
           MediaModel? mediaModel;
           try{

              final data  = FormData.fromMap({
                'file' : await MultipartFile.fromFile(filePath)
            });

            final response = await _networkServicesApi.postAPI('https://disaster-backend-5ekh.onrender.com/reports/create',data);
            if(response == null) throw GeneralException('No Response Found.');
            mediaModel = MediaModel.fromJson(response);
            } catch (error){
                throw GeneralException(error.toString());
            }

            return mediaModel;  

    } 



}