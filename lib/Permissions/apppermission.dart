import 'package:flutter/foundation.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:permission_handler/permission_handler.dart';


abstract class Apppermission {
     
     Future<bool> requestCameraPermission();
     Future<bool> requestStoragePermission();
     Future<bool> requestLocationPermission();
}



class PermissionService extends Apppermission{


     @override
     Future<bool> requestCameraPermission() async{
          
        try {
           PermissionStatus locationPermission = await Permission.camera.status;

           if(locationPermission.isGranted)
           { return true; }

           if(locationPermission.isDenied)
           { 
            locationPermission = await Permission.camera.request(); 
            return locationPermission.isGranted;
            }

           if(locationPermission.isPermanentlyDenied)
           { 
              openAppSettings();
           }    

         return false;
        } catch(error)
        { 
          return false;
        }
       }


     @override
     Future<bool> requestStoragePermission() async {

    try {

      Permission storagePermission;
      if (await Permission.photos.isRestricted || await Permission.photos.isLimited) {
        storagePermission = Permission.photos;
      } else {
        storagePermission = Permission.storage;
      }

      PermissionStatus storageStatus = await storagePermission.status;
    
      if(storageStatus.isGranted)
      {
          return true;
      }

      if (storageStatus.isDenied) {
        storageStatus = await storagePermission.request();
        return storageStatus.isGranted;
      }

      return false; 
    } catch (error) {
        return false;
    }
  }
  
  @override
  Future<bool> requestLocationPermission() async{
       
      try {
           PermissionStatus locationPermission = await Permission.location.status;

           if(locationPermission.isGranted)
           { return true; }

           if(locationPermission.isDenied)
           { 
            locationPermission = await Permission.location.request(); 
            return locationPermission.isGranted;
            }

           if(locationPermission.isPermanentlyDenied)
           { 
              openAppSettings();
           }    
            
         return false;
        } catch(error)
        { 
          debugPrint(error.toString());
          throw GeneralException(error.toString());
        }

  }
}