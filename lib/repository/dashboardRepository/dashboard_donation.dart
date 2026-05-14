import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardDonationRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<double> getAllDonationAmount() {
    return _firestore.collection('Donation').snapshots().map((snapshot) {
      double totalDonationAmount = 0.0;
      for (var doc in snapshot.docs) {
        totalDonationAmount += doc['amount'];
      }
      return totalDonationAmount;
    });
  }
}
