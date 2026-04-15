import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/login/login_bloc.dart';
import 'package:fyp_project/config/Components/CustomTextFeild.dart';
import 'package:fyp_project/utils/validation.dart';

class SignInEmailTextFeild extends StatelessWidget {
  const SignInEmailTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email!=current.email,
      builder: (context, state) {   
        return CustomTextFormField(
          label: "Email",
          prefixIcon: Icons.email_outlined,
          onChanged: (value) {
             context.read<LoginBloc>().add(OnChangedEmailEvent(email: value!.trim()));
          },
          onValidation: AppValidations .validateEmail,
        );
      },
    );
  }
}
