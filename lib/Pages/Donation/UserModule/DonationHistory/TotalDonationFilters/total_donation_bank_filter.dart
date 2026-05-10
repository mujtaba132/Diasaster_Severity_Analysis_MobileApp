import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/donation_transaction/donation_transaction_bloc.dart';

class TotalDonationBankFilter extends StatelessWidget {
  const TotalDonationBankFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Expanded(
      flex: 8,
      child: BlocBuilder<DonationTransactionBloc, DonationTransactionState>(
        buildWhen: (previous, current) =>
            previous.selectedBank != current.selectedBank ||
            previous.bankNames != current.bankNames,

        builder: (context, state) {
          if (state.bankNames.isEmpty) {
            return const SizedBox.shrink();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),

              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 3),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),

                gradient: LinearGradient(
                  colors: isDark
                      ? [const Color(0xff1E293B), const Color(0xff0F172A)]
                      : [Colors.white, const Color(0xffF8FAFC)],
                ),

                border: Border.all(color: theme.primaryColor.withOpacity(0.12)),

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

              child: Row(
                children: [
                  /// DROPDOWN
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: state.selectedBank,

                        dropdownColor: isDark
                            ? const Color(0xff111827)
                            : Colors.white,

                        borderRadius: BorderRadius.circular(20),

                        icon: AnimatedRotation(
                          turns: 0,

                          duration: const Duration(milliseconds: 250),

                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,

                            size: 28,

                            color: theme.iconTheme.color,
                          ),
                        ),

                        isExpanded: true,

                        style: TextStyle(
                          color: theme.textTheme.bodyLarge!.color,

                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),

                        items: state.bankNames.map((e) {
                          final isSelected = state.selectedBank == e;

                          return DropdownMenuItem(
                            value: e,

                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),

                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),

                              child: Row(
                                children: [
                                  Container(
                                    height: 34,
                                    width: 34,

                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,

                                      color: theme.primaryColor.withOpacity(
                                        0.12,
                                      ),
                                    ),

                                    child: Icon(
                                      Icons.account_balance_wallet_rounded,

                                      size: 18,

                                      color: theme.primaryColor,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Text(
                                      e,

                                      overflow: TextOverflow.ellipsis,

                                      style: TextStyle(
                                        fontSize: 14.5,

                                        fontWeight: FontWeight.w600,

                                        color: theme.textTheme.bodyLarge!.color,
                                      ),
                                    ),
                                  ),

                                  if (isSelected)
                                    Icon(
                                      Icons.check_circle_rounded,

                                      color: theme.primaryColor,

                                      size: 20,
                                    ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),

                        onChanged: (val) {
                          context.read<DonationTransactionBloc>().add(
                            OnChangeBankFilterEvent(bankName: val!),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
