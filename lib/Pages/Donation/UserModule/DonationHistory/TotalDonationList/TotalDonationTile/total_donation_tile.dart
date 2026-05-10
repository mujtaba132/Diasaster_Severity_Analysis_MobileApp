import 'package:flutter/material.dart';
import 'package:fyp_project/Model/donationModel/donation_model.dart';
import 'package:fyp_project/Pages/Donation/UserModule/DonationHistory/TotalDonationList/TotalDonationTile/tile_info.dart';
import 'package:fyp_project/utils/enums.dart';
import 'package:intl/intl.dart';

class ExpandableTile extends StatelessWidget {

  final DonationModel data;
  final VoidCallback onTap;
  final bool isDark;

  const ExpandableTile({
    super.key, 
    required this.data,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 450,
        ),

        curve: Curves.easeInOutCubic,

        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),

          gradient: LinearGradient(
            colors: data.isExpanded!
                ? isDark
                    ? [
                        const Color(0xff1E293B),
                        const Color(0xff0F172A),
                      ]
                    : [
                        Colors.white,
                        const Color(0xffF8FAFC),
                      ]
                : isDark
                    ? [
                        const Color(0xff111827),
                        const Color(0xff1F2937),
                      ]
                    : [
                        Colors.white,
                        Colors.white,
                      ],
          ),

          border: Border.all(
            color: data.isExpanded!
                ? theme.primaryColor
                    .withOpacity(0.35)
                : Colors.grey.withOpacity(0.12),
          ),

          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.25)
                  : Colors.grey.withOpacity(0.12),

              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Column(
          children: [

            /// TOP ROW
            Row(
              children: [

                /// ICON
                AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 350,
                  ),

                  height: 52,
                  width: 52,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    gradient: LinearGradient(
                      colors: data.method ==
                              DonationMethod.card
                          ? [
                              const Color.fromARGB(255, 100, 38, 207),
                              const Color.fromARGB(196, 86, 57, 250),
                            ]
                          : [
                              const Color.fromARGB(255, 76, 124, 175),
                              const Color.fromARGB(255, 75, 0, 150),
                            ],
                    ),
                  ),

                  child: Icon(
                    data.method ==
                            DonationMethod.card
                        ? Icons.credit_card_rounded
                        : Icons.account_balance_rounded,

                    color: Colors.white,
                    size: 28,
                  ),
                ),

                const SizedBox(width: 14),

                /// TEXT AREA
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(
                        data.bankName ?? "Unknown",

                        maxLines: 1,

                        overflow:
                            TextOverflow.ellipsis,

                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.w700,

                          color: theme
                              .textTheme
                              .bodyLarge!
                              .color,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [

                          Icon(
                            Icons.access_time_rounded,
                            size: 15,

                            color: theme
                                .textTheme
                                .bodySmall!
                                .color!
                                .withOpacity(0.6),
                          ),

                          const SizedBox(width: 5),

                          Expanded(
                            child: Text(
                              _getFormattedDateTime(
                                data.timeStamp
                                    .toString(),
                              ),

                              maxLines: 1,

                              overflow:
                                  TextOverflow
                                      .ellipsis,

                              style: TextStyle(
                                fontSize: 11.5,

                                color: theme
                                    .textTheme
                                    .bodySmall!
                                    .color!
                                    .withOpacity(
                                      0.65,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                /// AMOUNT
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end,

                  children: [

                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [
                            theme.primaryColor,
                            const Color.fromARGB(255, 0, 106, 212),
                          ],
                        ).createShader(bounds);
                      },

                      child: Text(
                        "Rs ${NumberFormat('#,##0') .format(data.amount)}",

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    AnimatedRotation(
                      turns:
                          data.isExpanded!
                              ? 0.5
                              : 0,

                      duration:
                          const Duration(
                        milliseconds: 350,
                      ),

                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            /// EXPANDED AREA
            AnimatedCrossFade(
              duration: const Duration(
                milliseconds: 400,
              ),

              crossFadeState:
                  data.isExpanded!
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,

              firstChild: const SizedBox(),

              secondChild: Container(
                margin:
                    const EdgeInsets.only(top: 18),

                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20),

                  color: isDark
                      ? Colors.white.withOpacity(0.04)
                      : Colors.grey.shade100,
                ),

                child: Column(
                  children: [

                    InfoTile(
                      icon: Icons.payments_rounded,

                      title: "Payment Method",

                      value: data.method ==
                              DonationMethod.card
                          ? "Credit / Debit Card"
                          : "Bank Transfer",
                    ),

                    const SizedBox(height: 14),

                    InfoTile(
                      icon:
                          Icons.lock_outline_rounded,

                      title: "Account Number",

                      value: data.method ==
                              DonationMethod.card
                          ? "**** **** **** 4242"
                          : "********${_getLastDigits(data.accountNo ?? '')}",
                    ),

                    const SizedBox(height: 14),

                    InfoTile(
                      icon: Icons.verified_rounded,

                      title: "Transaction Status",

                      value: "Successful",
                      valueColor: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _getLastDigits(
    String account,
  ) {
    return account.length >= 5
        ? account.substring(
            account.length - 5,
          )
        : account;
  }

  static String _getFormattedDateTime(
    String date,
  ) {
    DateTime dateTime =
        DateTime.parse(date);

    return DateFormat(
      "dd MMM yyyy • hh:mm a",
    ).format(dateTime);
  }
}
