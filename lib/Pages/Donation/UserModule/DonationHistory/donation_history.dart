import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationHistory/TotalDonationCard/total_donation_card.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationHistory/TotalDonationFilters/total_donation_bank_filter.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationHistory/TotalDonationFilters/total_donation_date_filter.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationHistory/TotalDonationList/total_donation_list.dart';
import 'package:fyp_project/blocs/donation_transaction/donation_transaction_bloc.dart';
import 'package:fyp_project/main.dart';

class DonationScreen extends StatefulWidget {
  final String userId;
  final bool isAdmin;
  const DonationScreen({super.key,required this.userId,required this.isAdmin});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {

  late DonationTransactionBloc _donationTransactionBloc;


  @override
  void initState() {
    super.initState();
    _donationTransactionBloc = getit<DonationTransactionBloc>();
    _donationTransactionBloc.add(OnLoadTransactionHistory(userId: widget.userId));
  }

  @override
  void dispose() {
    _donationTransactionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(
      value: _donationTransactionBloc,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("Donations")),
          body: Column(
            children: [
        
              TotalDonationCard(userId: widget.userId,isAdmin: widget.isAdmin),
        
              Row(
                children: [
        
                  TotalDonationBankFilter(),
        
                  TotalDonationDateFilter(),
                  
                ],
              ),
        
              TotalDonationList(),
        
            ],
          ),
        ),
      ),
    );
  }
}


