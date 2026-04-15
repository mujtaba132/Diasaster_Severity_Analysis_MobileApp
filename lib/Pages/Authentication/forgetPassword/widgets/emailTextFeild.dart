import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/forgetpassword/forget_password_bloc.dart';
import 'package:fyp_project/config/Components/CustomTextFeild.dart';
import 'package:fyp_project/utils/validation.dart';

class ForgetPasswordEmailFeild extends StatelessWidget {
  const ForgetPasswordEmailFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
      buildWhen: (previous, current) => previous.email!=current.email,
      builder: (context, state) {
        return CustomTextFormField(
          onValidation: AppValidations.validateEmail,
          onChanged: (value) {
            context.read<ForgetPasswordBloc>().add(OnChangeEmailEvent(email: value!.trim()));
          },
          label: "Email",
          prefixIcon: Icons.email_outlined,
        );
      },
    );
  }
}
