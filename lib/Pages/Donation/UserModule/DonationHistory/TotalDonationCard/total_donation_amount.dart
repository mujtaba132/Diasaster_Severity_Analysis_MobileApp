import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/donation_transaction/donation_transaction_bloc.dart';
import 'package:fyp_project/config/Components/Custom_circle_avatar.dart';
import 'package:fyp_project/config/components/CustomSnackbar.dart';
import 'package:fyp_project/utils/enums.dart';
import 'package:intl/intl.dart';

class DonationAmount extends StatelessWidget {

  const DonationAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationTransactionBloc,
        DonationTransactionState>(
      buildWhen: (previous, current) =>
          previous.totalAmount != current.totalAmount ||
          previous.donationTransactionStatus !=
              current.donationTransactionStatus,

      builder: (context, state) {

        if (state.donationTransactionStatus ==
            DonationTransactionStatus.error) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomSnackBar.error(state.error);
          });
        }
      
        String? userName = state.userName;
        String? imageUrl = state.userProfile;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// USER INFO
            Row(
              children: [

                Hero(
                  tag: userName,

                  child: Container(
                    padding: const EdgeInsets.all(2.5),

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 2,
                      ),
                    ),

                    child: 
                    CustomCircleAvatar(imageUrl: imageUrl,userName: userName)
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(
                        userName.split('@').first,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        "Helping Humanity ❤️",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            /// TITLE
            Text(
              "Total Donations",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            /// ANIMATED AMOUNT
            if (state.donationTransactionStatus ==
                DonationTransactionStatus.loading)
              const SizedBox(
                height: 28,
                width: 28,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            else
              TweenAnimationBuilder<double>(
                tween: Tween<double>(
                  begin: 0,
                  end: state.totalAmount.toDouble(),
                ),

                duration: const Duration(milliseconds: 1800),
                curve: Curves.easeOutExpo,

                builder: (context, value, child) {

                  final formattedAmount =
                      NumberFormat("#,##0")
                          .format(value.toInt());

                  return Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [

                      ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            colors: [
                              Colors.white,
                              Color(0xffFFE082),
                            ],
                          ).createShader(bounds);
                        },

                        child: Text(
                          "Rs. $formattedAmount",

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            height: 1,
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 4),

                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),

                          decoration: BoxDecoration(
                            color:
                                Colors.green.withOpacity(0.18),
                            borderRadius:
                                BorderRadius.circular(30),
                          ),

                          child: const Row(
                            children: [
                              Icon(
                                Icons.trending_up_rounded,
                                color: Colors.greenAccent,
                                size: 14,
                              ),

                              SizedBox(width: 3),

                              Text(
                                "Live",
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
          ],
        );
      },
    );
  }
}