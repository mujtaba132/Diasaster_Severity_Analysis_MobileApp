import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_project/Model/dashboardModels/UserModel/user_model.dart';

class DashboardUsersRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<int> getAllUsersCount() {
    return _firestore.collection('Users').snapshots().map(
          (snapshot) => snapshot.size,
        );
  }


  Stream<int> getAdminUsersCount() {
    return _firestore
        .collection('Users')
        .where('role', isEqualTo: 'admin')
        .snapshots()
        .map((snapshot) => snapshot.size);
  }


  Stream<int> getNormalUserCount() {
    return _firestore
        .collection('Users')
        .where('role', isEqualTo: 'user')
        .snapshots()
        .map((snapshot) => snapshot.size);
  }

  
  Stream<DashboardUserModel> getUserDashboardModel() {
    return _firestore.collection('Users').snapshots().map(
      (snapshot) {
        int totalusers = snapshot.docs.length;

        print(totalusers);
        int admins = snapshot.docs.where((doc) {
          return doc['role'] == 'admin';
        }).length;
       
        print(admins);
        int normalUsers = snapshot.docs.where((doc) {
          return doc['role'] == 'user';
        }).length;

        print(normalUsers);
        return DashboardUserModel(
         totalUsers: totalusers,
         totalNormalUsers: normalUsers,
         totalAdmins: admins
        );
      },
    );
  }

}