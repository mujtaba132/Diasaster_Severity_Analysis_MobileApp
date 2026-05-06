import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/donation/donation_bloc.dart';

class DonationAmountFeild extends StatelessWidget {
  final TextEditingController amountController;
  const DonationAmountFeild({super.key, required this.amountController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<DonationBloc, DonationState>(
      buildWhen: (previous, current) =>
      current.donatedAmount!=previous.donatedAmount,
      builder: (context, state) {
        return TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: "Rs ",
            hintText: "Enter amount",
            filled: true,
            fillColor: theme.cardColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (amount) {
            context.read<DonationBloc>().add(OnChangeDonationAmountEvent(amount: amount));
          },
        );
      },
    );
  }
}
