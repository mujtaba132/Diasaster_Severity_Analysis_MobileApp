import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_project/Model/dashboardModels/PostModel/post_model.dart';

class DashboardPostRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<int> getAllPostsCount() {
    return _firestore.collection('UsersMedia').snapshots().map(
          (snapshot) => snapshot.size,
        );
  }


  Stream<DashboardPostModel> getPostDashboardModel() {
    return _firestore.collection('UsersMedia').snapshots().map(
      (snapshot) {
        int totalmedia = snapshot.docs.length;


        int verifiedmedia = snapshot.docs.where((doc) {
          return doc['post_status'] == 'approved';
        }).length;
       

        int unverifiedmedia = snapshot.docs.where((doc) {
          return doc['post_status'] == 'pending' || doc['post_status'] == 'processing';
        }).length;

        return DashboardPostModel(
          nonVerifyPosts: unverifiedmedia,
          totalPosts: totalmedia,
          verifiedPosts: verifiedmedia 
        );
      },
    );
  }


}