import 'dart:io';

import 'package:fyp_project/ai_model/predict_media.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';

class ModelPredictRepository {
       
      final ModelPredict _model = ModelPredict();

      Future<void> loadModel() async{

              try{
                await _model.loadModel(); 
                } on TimeoutException{
                   throw TimeoutException('');
                } catch (e)
                {
                  throw GeneralException(e.toString());
                }

      }

      Map<String,dynamic> predictImage(File file) {
                 Map<String,dynamic> map;
                 try{
                     
                    map =  _model.predictImage(file);
                    return map;

                 } catch(e){
                    throw GeneralException(e.toString());
                 }
      }

      Future<Map<String,dynamic>> predictVideo(File file) async{
                 Map<String,dynamic> map;
                 try{
                     
                    map = await _model.predictVideo(file.path);
                    return map;

                 } catch(e){
                    throw GeneralException(e.toString());
                 }
      }

      
}