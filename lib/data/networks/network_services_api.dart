import 'package:dio/dio.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:fyp_project/data/networks/base_api_services.dart';

class NetworkServicesApi extends BaseApiService{
  
  final Dio _dio = Dio();

  @override
  Future<dynamic> getAPI(String url) async{
      dynamic jsonResponse;
      try{
             final response = await _dio.get(url);
             jsonResponse = getAPIResponse(response);
    
      } on TimeoutException {
          throw TimeoutException('');
      } on NoInternetException {
          throw NoInternetException('');
      } catch (error) {
          throw GeneralException(error.toString());
      }

      return jsonResponse;
  }


  @override
  Future<dynamic> postAPI(String url,var data) async{
      dynamic jsonResponse;
      try{
             final response = await _dio.post(url,data: data);
             jsonResponse = getAPIResponse(response);
    
      } on TimeoutException {
          throw TimeoutException('');
      } on NoInternetException {
          throw NoInternetException('');
      } catch (error) {
          throw GeneralException(error.toString());
      }

      return jsonResponse;
  }
   

  @override
  Future<dynamic> deleteAPI(String url) async{
     dynamic jsonResponse;
     try{
             final response = await _dio.delete(url);
             jsonResponse = getAPIResponse(response);
    
      } on TimeoutException {
          throw TimeoutException('');
      } on NoInternetException {
          throw NoInternetException('');
      } catch (error) {
          throw GeneralException('something went wrong');
      }
      return jsonResponse;
  }

  

  dynamic getAPIResponse(Response response)
  {
          switch (response.statusCode) {
            case 200:
               return response.data;
            case 400:
               return response.data;
            case 422:
              throw GeneralException('Unprocessable entitiy.');
            case 401:
              throw FobiddenException('');
            case 403:
              throw UnAuthorizedException('');
            default:
              throw GeneralException('something went wrong!');
          }
  }
}