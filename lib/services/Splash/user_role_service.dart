import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoleService {
  // Get User Role
  static Future<String> getUserRole() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    final prefs = await SharedPreferences.getInstance();

    // Internet Available
    if (connectivityResult.first != ConnectivityResult.none) {
      try {
        print("Internet Available");
        final uid = FirebaseAuth.instance.currentUser!.uid;

        final snapshot = await FirebaseFirestore.instance
            .collection("Users")
            .doc(uid)
            .get();

        final role = snapshot.data()?['role'] ?? "user";
        print("Role is here ${snapshot.data()?['role']}");
        // Save role locally
        await prefs.setString("userRole", role);

        return role;
      } catch (e) {
        print(e);
        // If firebase error then load local role
        return prefs.getString("userRole") ?? "user";
      }
    }

    // No Internet
    return prefs.getString("userRole") ?? "user";
  }
}
