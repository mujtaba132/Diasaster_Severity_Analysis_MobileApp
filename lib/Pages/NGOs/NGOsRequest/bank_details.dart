import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/register_ngo/register_ngo_bloc.dart';
import 'package:fyp_project/config/Components/CustomTextFeild.dart';
import 'package:fyp_project/utils/validation.dart';

class BankDetailsSection extends StatelessWidget {
  const BankDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<RegisterNgoBloc, RegisterNgoState>(
          buildWhen: (previous, current) =>
              previous.bankName != current.bankName,
          builder: (context, state) {
            return CustomTextFormField(
              label: "Bank Name",
              prefixIcon: Icons.account_balance_rounded,
              onChanged: (value) {
                context.read<RegisterNgoBloc>().add(
                  OnChangedBankNameEvent(bankName: value ?? ''),
                );
              },
              onValidation: (value) {
                return AppValidations.validateRequiredFeild(value);
              },
            );
          },
        ),
        SizedBox(height: 12),
        BlocBuilder<RegisterNgoBloc, RegisterNgoState>(
          buildWhen: (previous, current) => previous.accountNo!=current.accountNo,
          builder: (context, state) {
            return CustomTextFormField(
              label: "Account No.",
              textInputType: TextInputType.number,
              prefixIcon: Icons.numbers,
              onChanged: (value) {
                context.read<RegisterNgoBloc>().add(OnChangedAccountNoEvent(accountNo: value ?? ''));
              },
              onValidation: (value) {
                return AppValidations.validateRequiredFeild(value);
              },
            );
          },
        ),
      ],
    );
  }
}
