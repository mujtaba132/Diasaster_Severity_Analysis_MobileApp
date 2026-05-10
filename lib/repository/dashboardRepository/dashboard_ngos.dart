import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_project/Model/dashboardModels/NgoModel/ngo_model.dart';


class DashboardNgoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllNgoRequests() {
    return _firestore.collection('NGOsRequests').snapshots();
  }


  Stream<DashboardNgoModel> getNgoDashboardModel() {
    return _firestore.collection('NGOsRequests').snapshots().map(
      (snapshot) {
        int totalNgos = snapshot.docs.length;


        int verifiedNgos = snapshot.docs.where((doc) {
          return doc['isVerified'] == true;
        }).length;
       

        int unverifiedNgos = snapshot.docs.where((doc) {
          return doc['isVerified'] == false;
        }).length;

        return DashboardNgoModel(
          totalNgos: totalNgos,
          verifiedNGOs: verifiedNgos,
          nonVerifyNGOs: unverifiedNgos,
        );
      },
    );
  }
}