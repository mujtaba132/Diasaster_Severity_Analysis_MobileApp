import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Donation/DonationSheet/DonationAmount/donation_amount.dart';
import 'package:fyp_project/Pages/Donation/DonationSheet/DonationList/donation_list.dart';
import 'package:fyp_project/blocs/donation/donation_bloc.dart';
import 'package:fyp_project/main.dart';

class DonationBottomSheet extends StatefulWidget {
  const DonationBottomSheet({super.key});

  @override
  State<DonationBottomSheet> createState() => DonationBottomSheetState();
}

class DonationBottomSheetState extends State<DonationBottomSheet> {
  int selectedIndex = 0;
  final TextEditingController amountController = TextEditingController();
  late DonationBloc _donationBoc;
  @override
  void initState() {
    super.initState();
    _donationBoc = getit<DonationBloc>();
    _donationBoc.add(OnLoadDonationNGOsEvent());
  }

  @override
  void dispose() {
    _donationBoc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider.value(
      value: _donationBoc,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 5,
                  width: 50,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                /// PAYMENT OPTIONS (NGO + CARD IN SAME SELECTABLE LIST)
                DonationList(),

                const SizedBox(height: 12),

                DonationAmountFeild(amountController: amountController),

                const SizedBox(height: 15),

                /// DONATE BUTTON
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Color.fromARGB(255, 48, 68, 216), Color.fromARGB(255, 15, 18, 146)],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Donate Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
