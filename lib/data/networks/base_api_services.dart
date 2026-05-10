abstract class BaseApiService{

      Future<dynamic> getAPI(String url);
      Future<dynamic> postAPI(String url ,var data,Map<String,dynamic>? header);
      Future<dynamic> deleteAPI(String url);
      
}