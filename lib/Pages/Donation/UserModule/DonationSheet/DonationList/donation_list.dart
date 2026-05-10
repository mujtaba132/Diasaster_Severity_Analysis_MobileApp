import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/NGOModel/ngo_model.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationSheet/DonationList/donation_card.dart';
import 'package:fyp_project/blocs/donation/donation_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/utils/enums.dart';

class DonationList extends StatelessWidget {
  const DonationList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: BlocBuilder<DonationBloc, DonationState>(
        buildWhen: (previous, current) =>
            previous.verifiedNGOsDonationStatus !=
                current.verifiedNGOsDonationStatus ||
            previous.donationNGOs.length != current.donationNGOs.length ||
            previous.selectedNgoId!=current.selectedNgoId,
        builder: (context, state) {
          if (state.verifiedNGOsDonationStatus == VerifiedNGOsDonationStatus.loading 
          ) {
            return SizedBox(
              height: 300,
              child: Center(child: CustomLoading(color: theme.primaryColor)),
            );
          } else if (state.verifiedNGOsDonationStatus ==
              VerifiedNGOsDonationStatus.error) {
            return CustomException(message: state.error.toString());
          }

          final ngos = state.donationNGOs;
          return SizedBox(
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: ngos.length + 1,
              itemBuilder: (context, index) {
                final isCard = index == ngos.length;

                if (isCard) {
                  return GestureDetector(
                    onTap: () {
                      context.read<DonationBloc>().add(
                        OnUpdateIndexEvent(ngoId: "card"), // special id
                      );
                    },
                    child: DonationNGOCard(
                      ngo: NGOModel(id: "card", isSelected: false),
                      isCard: true,
                      isSelected: state.selectedNgoId == "card" ,
                    ),
                  );
                }

                final ngo = ngos[index];
                return GestureDetector(
                  onTap: () {
                    context.read<DonationBloc>().add(
                      OnUpdateIndexEvent(ngoId: ngo.id!),
                    );
                  },
                  child: BlocSelector<DonationBloc, DonationState, NGOModel>(
                    selector: (state) {
                      return state.donationMap[ngo.id];
                    },
                    builder: (context, ngo) {
                      return DonationNGOCard(
                        ngo: ngo,
                        isSelected: state.selectedNgoId == ngo.id, 
                        isCard: false);
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
