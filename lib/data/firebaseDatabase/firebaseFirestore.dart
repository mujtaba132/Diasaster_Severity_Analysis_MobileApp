import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  DocumentReference getDocRef(String path) {
    return _db.doc(path);
  }

  CollectionReference getCollectionRef(String path) {
    return _db.collection(path);
  }


  Future<void> setData({
    required String docpath, 
    required String collectionPath, 
    required Map<String, dynamic> data,
  }) async {
    await _db.collection(collectionPath).doc(docpath).set(data);
  }

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await _db.doc(path).update(data);
  }


  Future<void> deleteData({
    required String path,
  }) async {
    await _db.doc(path).delete();
  }


  Future<DocumentSnapshot> getData({
    required String path,
  }) async {
    return await _db.doc(path).get();
  }

 
  Stream<DocumentSnapshot> listenToDocument({
    required String path,
  }) {
    return _db.doc(path).snapshots();
  }


  Stream<QuerySnapshot> listenToCollection({
    required String collectionPath,
  }) {
    return _db.collection(collectionPath).snapshots();
  }


  Future<void> pushData({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _db.collection(collectionPath).add(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addUserMedia({
  required String userId,
  required Map<String, dynamic> data,
   }) async {
  await _db
      .collection('Users')          
      .doc(userId)                
      .collection('UserMedia')   
      .add(data);               
  }


}