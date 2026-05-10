import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/donation_transaction/donation_transaction_bloc.dart';

class TotalDonationDateFilter extends StatelessWidget {
  const TotalDonationDateFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      flex: 3,
      child: BlocBuilder<DonationTransactionBloc, DonationTransactionState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () async {
              DateTime? dateTime = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );

              context.read<DonationTransactionBloc>().
              add(OnChangeDateFilterEvent(date: dateTime));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 17),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [
                    theme.primaryColor,
                    theme.primaryColor.withOpacity(0.7),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.calendar_today, color: Colors.white, size: 16),
                  SizedBox(width: 6),
                  Text(
                    "Date",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
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
