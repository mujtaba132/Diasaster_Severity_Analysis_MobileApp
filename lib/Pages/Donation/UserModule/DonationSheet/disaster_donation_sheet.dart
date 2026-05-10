import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationSheet/DonationAmount/donation_amount.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationSheet/DonationBtn/donation_btn.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationSheet/DonationList/donation_list.dart';
import 'package:fyp_project/blocs/donation/donation_bloc.dart';
import 'package:fyp_project/main.dart';

class DonationBottomSheet extends StatefulWidget {

  final String userId;
  const DonationBottomSheet({super.key,required this.userId});

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
    _donationBoc.add(OnLoadDonationNGOsEvent(userId: widget.userId));
  }

  @override
  void dispose() {
    _donationBoc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  

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

                DonationList(),

                const SizedBox(height: 12),

                DonationAmountFeild(amountController: amountController),

                const SizedBox(height: 15),

                DonationBtn(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
