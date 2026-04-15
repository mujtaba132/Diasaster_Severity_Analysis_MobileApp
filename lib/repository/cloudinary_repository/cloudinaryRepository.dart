import 'dart:io';
import 'package:fyp_project/Cloudinary/DataUploadService.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';

class Cloudinaryrepository {
    

    static final CloudinaryService _cloudinaryService =  CloudinaryService();

     Future<String?> uploadCloudinaryImage({
      required String filePath}) async{

              String? filepath; 
            try{
                 filepath = await _cloudinaryService.uploadFile(filePath: filePath, isVideo: false);
                 return filepath;
            } on SocketException {
               throw NoInternetException('');
            } on TimeoutException {
              throw TimeoutException('');
            }
            catch(error)
            {
               throw GeneralException(error.toString());
            }
    }

     Future<String?> uploadCloudinaryVideo({
      required String filePath}) async{

            try{
                String? filepath = await _cloudinaryService.uploadFile(filePath: filePath, isVideo: true);
                 return filepath;
            } on SocketException {
               throw NoInternetException('');
            } on TimeoutException {
              throw TimeoutException('');
            }
            catch(error)
            {
               throw GeneralException(error.toString());
            }
    }

}