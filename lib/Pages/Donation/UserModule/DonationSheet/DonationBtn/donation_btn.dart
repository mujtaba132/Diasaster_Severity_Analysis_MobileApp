import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationDialog/donation_dialog.dart';
import 'package:fyp_project/blocs/donation/donation_bloc.dart';
import 'package:fyp_project/config/Components/Custom_FlashBar.dart';
import 'package:fyp_project/utils/enums.dart';

class DonationBtn extends StatelessWidget {
  const DonationBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DonationBloc, DonationState>(
      listenWhen: (previous, current) =>
          previous.donationStatus != current.donationStatus,
    
      listener: (context, state) {
        if (state.donationStatus == DonationStatus.error) {
          CustomFlushBar.error(state.error.toString());
        } else if (state.donationStatus == DonationStatus.success) {
              Navigator.pop(context);
              Future.delayed(const Duration(microseconds: 200),() async{
               showDonationDialog(
                // ignore: use_build_context_synchronously
                context,
                amount: state.donatedAmount,
              );
            });
        }
      },
      child: BlocBuilder<DonationBloc, DonationState>(
        buildWhen: (previous, current) =>
            previous.donationStatus != current.donationStatus ||
            previous.selectedNgoId != current.selectedNgoId ||
            previous.donatedAmount != current.donatedAmount,

        builder: (context, state) {
          print(state.donatedAmount);
          print(state.selectedNgoId);
          return GestureDetector(
            onTap: state.donationStatus == DonationStatus.loading?
             (){}:() {
              state.selectedNgoId == 'card'?
              context.read<DonationBloc>().add(OnCardPaymentEvent(
                amount: state.donatedAmount.toString(),
                currency: 'usd')):
              context.read<DonationBloc>().add(OnDonateAmountEvent());
              
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 48, 68, 216),
                    Color.fromARGB(255, 15, 18, 146),
                  ],
                ),
              ),
              child: Center(
                child: state.donationStatus == DonationStatus.loading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        "Donate Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
