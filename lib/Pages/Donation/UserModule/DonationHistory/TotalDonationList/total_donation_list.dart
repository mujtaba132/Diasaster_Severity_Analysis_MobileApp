import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationHistory/TotalDonationList/TotalDonationTile/total_donation_tile.dart';
import 'package:fyp_project/blocs/donation_transaction/donation_transaction_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/utils/enums.dart';

class TotalDonationList extends StatelessWidget {
  const TotalDonationList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Expanded(
      child: BlocBuilder<
          DonationTransactionBloc,
          DonationTransactionState>(
        buildWhen: (previous, current) =>
            previous.searchedTransactions !=
                current.searchedTransactions ||
            previous.donationTransactionStatus !=
                current.donationTransactionStatus,

        builder: (context, state) {

          if (state.donationTransactionStatus ==
              DonationTransactionStatus.loading) {
            return Center(
              child: CustomLoading(
                color: theme.primaryColor,
              ),
            );
          }

          if (state.donationTransactionStatus ==
              DonationTransactionStatus.error) {
            return CustomException(
              message: state.error,
            );
          }

          if (state.searchedTransactions.isEmpty) {
            return const CustomException(
              message: 'No Donation Transaction Found',
            );
          }

          final transactions =
              state.searchedTransactions;

          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),

            physics: const BouncingScrollPhysics(),

            itemCount: transactions.length,

            separatorBuilder: (_, _) =>
                const SizedBox(height: 14),

            itemBuilder: (context, index) {

              final transaction =
                  transactions[index];

              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),

                duration: Duration(
                  milliseconds: 400 + (index * 100),
                ),

                curve: Curves.easeOut,

                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      40 * (1 - value),
                    ),

                    child: Opacity(
                      opacity: value,
                      child: child,
                    ),
                  );
                },

                child: ExpandableTile(
                  data: transaction,

                  isDark: isDark,

                  onTap: () {
                    context
                        .read<
                            DonationTransactionBloc>()
                        .add(
                          OnExpandTileEvent(
                            transactionId:
                                transaction
                                    .donationId!,
                          ),
                        );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}


