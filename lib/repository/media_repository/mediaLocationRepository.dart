import 'dart:io';

import 'package:fyp_project/Permissions/apppermission.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class MediaLocationRepository {
   
     final PermissionService _permissionService =  PermissionService();

     Future<Position> getCurrentLocation() async{

          Position currentPosition;     
          bool isGranted =  await _permissionService.requestLocationPermission();

          if(isGranted){
                bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

                if(isLocationEnabled){
                     currentPosition = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high,
                      timeLimit: Duration(seconds: 5)
                     );
                     return currentPosition;
                } else{
                    await Geolocator.openLocationSettings();
                    throw GeneralException('Location service was not enabled'); 
                }

          } else {
                throw GeneralException('No Location Permission Found');
          }
     }


     Future<String> getAddress({required Position position}) async{

       try {

        List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
        if(placemarks.first.locality == null) throw GeneralException('Location not availiable');
        return placemarks.first.locality!;

        } on TimeoutException {
          throw TimeoutException('');
        } on SocketException {
          throw NoInternetException('');
        } catch (error){
             throw GeneralException(error.toString());
        }
     }

}