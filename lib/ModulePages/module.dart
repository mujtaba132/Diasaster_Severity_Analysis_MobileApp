import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/Pages/AdminDashboard/admin_dashboard.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationHistory/donation_history.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerified/verifiedNGOs_screen.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerify/NGOsRequests/requestListNGOs_screen.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/LocalUploadScreen/localUpload_screen.dart';
import 'package:fyp_project/Pages/UserRoles/all_user_screen.dart';
import 'package:fyp_project/Pages/feed/admin/admin_feed_screen.dart';
import 'package:fyp_project/Pages/feed/citizen/citizen_feed_screen.dart';

class AppModule {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser?.uid ?? "";

  late final List<dynamic> admin = [
    AdminDashboardScreen(),
    AdminFeedScreen(),
    AllUsersScreen(),
    NGORequestListScreen(),
  ];

  late final List<dynamic> user = [
    LocalUploadScreen(),
    CitizenFeedListScreen(),
    VerifiedNGOsListScreen(),
    DonationScreen(userId: userId, isAdmin: false),
  ];
}
