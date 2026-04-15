import 'package:file_picker/file_picker.dart';

abstract class MediaService {
     
     Future<String?> pickMedia();


}

class PickMediaService extends MediaService{
    

     @override
    Future<String?> pickMedia() async{
             
             final FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['png','jpeg','jpg','mp4','mov'],
             );
  
            if(result!=null){
                   for(var file in result.files)
                   {
                        final path = file.path;

                        if(path == null) continue;

                        return path;
                   }
            }

            return null;
    }


}