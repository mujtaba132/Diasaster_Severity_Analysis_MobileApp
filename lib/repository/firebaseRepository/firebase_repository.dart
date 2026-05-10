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
      
       Stream<List<QueryDocumentSnapshot>> listenToData({required String path,String? orderby})
       {
              try{
                  return  _firestoreService.listenToCollection(collectionPath: path,orderby: orderby).map((event) { 
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

      
    
        Stream<List<QueryDocumentSnapshot>> searchDocFromCollection({
          required String path,
          required String key,
          required String query,
          String? orderBy,
        })
       {
              try{
                  return  _firestoreService.searchDocsFromCollection(collectionPath: path,key: key,query: query,orderBy: orderBy)
                  .map((event) { 
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


        Stream<List<QueryDocumentSnapshot>> multiSearchDocFromCollection({
          required String path,
          required String key,
          required bool query,
          required String key2,
          required String query2
        })
       {
              try{
                  return  _firestoreService.multiSearchDocsFromCollection
                  (collectionPath: path,key: key,query: query,key2: key2, query2: query2)
                  .map((event) { 
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
      

        Future<void> setSubCollectionData({
          required String mainCollection,
          required String mainDoc,
          required String subCollection,
          required String subDoc,
          required Map<String,dynamic> data})
        async{
 
                try {
                  
                   await _firestoreService.addSubCollectionData(
                    mainCollection: mainCollection,
                    mainDocId: mainDoc,
                    subCollection: subCollection,
                    subDocId: subDoc,
                    data: data);

               } on SocketException {
                  throw NoInternetException('');
               } on TimeoutException {
                  throw TimeoutException('');
               } catch (error)
               {
                  throw GeneralException(error.toString());
               }

        } 

       Stream<List<QueryDocumentSnapshot>> listenToSubCollectionData({
          required String mainCollection,
          required String mainDoc,
          required String subCollection,
          String? orderBy,
          bool? isDescending,
       })
       {
              try{
                  return  _firestoreService.listenToSubCollection(
                    mainCollection: mainCollection,
                    mainDocId: mainDoc,
                    subCollection: subCollection,
                    orderBy: orderBy,
                    isDescending: isDescending,
                  ).map((event) { 
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
       
}