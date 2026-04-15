import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_project/data/exceptions/exceptions.dart';
import 'package:fyp_project/data/firebaseDatabase/firebaseFirestore.dart';

class FirebaseRepository {

        static final FirestoreService _firestoreService = FirestoreService();

        Future<void> setData({required String collectionPath,required String docpath,required Map<String,dynamic> data})
        async{
 
                try {
                   await _firestoreService.setData(collectionPath: collectionPath,docpath: docpath,data: data);
               } on SocketException {
                  throw NoInternetException('');
               } on TimeoutException {
                  throw TimeoutException('');
               } catch (error)
               {
                  throw GeneralException(error.toString());
               }

        } 


         Future<void> updateData({required String path,required Map<String,dynamic> data})
        async{

                try {
                   await _firestoreService.updateData(path: path,data: data);
               } on SocketException {
                  throw NoInternetException('');
               } on TimeoutException {
                  throw TimeoutException('');
               } catch (error)
               {
                  throw GeneralException(error.toString());
               }

        } 


        Future<void> deleteData({required String path})
        async{

                try {
                   await _firestoreService.deleteData(path: path);
               } on SocketException {
                  throw NoInternetException('');
               } on TimeoutException {
                  throw TimeoutException('');
               } catch (error)
               {
                  throw GeneralException(error.toString());
               }

        } 

        
        Future<Map<String,dynamic>> getData({required String path})
        async{

                try {
                   DocumentSnapshot dataSnapshot = await _firestoreService.getData(path: path);
                   if(dataSnapshot.exists)
                   {
                    return dataSnapshot.data() as Map<String,dynamic>;
                   }
                   return {};
               } on SocketException {
                  throw NoInternetException('');
               } on TimeoutException {
                  throw TimeoutException('');
               } catch (error)
               {
                  throw GeneralException(error.toString());
               }

        } 
      
       Stream<List<QueryDocumentSnapshot>> listenToData({required String path})
       {
              try{
                  return  _firestoreService.listenToCollection(collectionPath: path).map((event) { 
                         return event.docs; 
                    });                  
              } on SocketException {
                  throw NoInternetException('');
               } on TimeoutException {
                  throw TimeoutException('');
               } catch (error)
               {
                  throw GeneralException(error.toString());
               }
       }


        Future<void>  pushData({required String path,required Map<String,dynamic> data})
        async{

                try {
                   await _firestoreService.pushData(collectionPath: path,data: data);
               } on SocketException {
                  throw NoInternetException('');
               } on TimeoutException {
                  throw TimeoutException('');
               } catch (error)
               {
                  throw GeneralException(error.toString());
               }

        } 

         Future<void>  pushUserMediaData({required String userId,required Map<String,dynamic> data})
        async{

                try {
                   await _firestoreService.addUserMedia(userId: userId,data: data);
               } on SocketException {
                  throw NoInternetException('');
               } on TimeoutException {
                  throw TimeoutException('');
               } catch (error)
               {
                  throw GeneralException(error.toString());
               }

        } 
       
}