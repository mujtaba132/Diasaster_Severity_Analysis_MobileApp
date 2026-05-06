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


  Stream<QuerySnapshot> searchDocsFromCollection({
    required String collectionPath,
    required String key,
    required String query,
  }) {
    return _db.collection(collectionPath).where(key , isEqualTo: query).snapshots();
  }
   
   
  Stream<QuerySnapshot> multiSearchDocsFromCollection({
    required String collectionPath,
    required String key,
    required bool query,
    required String key2,
    required String query2,
  }) {
    return _db.collection(collectionPath).where(key , isEqualTo: query).
    where(key2,isEqualTo:query2).snapshots();
  }

    Future<void> addSubCollectionData({
    required String mainCollection,
    required String mainDocId,
    required String subCollection,
    required String subDocId,
    required Map<String, dynamic> data,
    }) async {
    try {
      await _db.collection(mainCollection).doc(mainDocId).
        collection(subCollection).doc(subDocId).set(data);
    } catch (e) {
      throw Exception(e.toString());
    }
   }

    Stream<QuerySnapshot> listenToSubCollection({
    required String mainCollection,
    required String mainDocId,
    required String subCollection,
    String? orderBy,
    bool? isDescending,
  }) {

    return 
        orderBy!=null || orderBy!.isEmpty?
        _db.collection(mainCollection).doc(mainDocId).
        collection(subCollection).orderBy(orderBy,descending: isDescending!).snapshots():
       _db.collection(mainCollection).doc(mainDocId).
        collection(subCollection).snapshots();
  }


 
}