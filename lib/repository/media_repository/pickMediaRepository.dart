import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:fyp_project/services/mediaService/media_service.dart';

class PickMediaRepository {
     
     final  PickMediaService _pickMediaService = PickMediaService();

     Future<String?> pickDeviceMedia() async{
                 
                 try{
                        String? filePath =  await _pickMediaService.pickMedia();
                        return filePath;
                   } on TimeoutException{
                        throw TimeoutException('');
                   } catch (error) {
                        throw GeneralException('Something went wrong while picking the media.');
                   }

     }
}