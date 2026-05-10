import 'package:flutter/material.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationHistory/TotalDonationCard/total_donation_amount.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationSheet/disaster_donation_sheet.dart';



class TotalDonationCard extends StatelessWidget {

  final String userId;
  final bool isAdmin;

  const TotalDonationCard({super.key,required this.userId,required this.isAdmin});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      padding: const EdgeInsets.only(top: 17,left: 14,right: 14,bottom: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 13, 31, 166),
            Color.fromARGB(255, 80, 77, 216),
            Color.fromARGB(255, 60, 110, 209),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.18),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),

      child: Row(
        children: [

          const SizedBox(width: 16),

          /// DONATION INFO
          Expanded(
            child: DonationAmount(),
          ),

          const SizedBox(width: 12),

          /// DONATE BUTTON
          isAdmin?
          const SizedBox.shrink():
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                builder: (_) => DonationBottomSheet(userId: userId),
              );
            },

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 102, 145, 255),
                    Color.fromARGB(255, 9, 71, 217),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 140, 255).withOpacity(0.35),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),

              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

