import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/signup/signup_bloc.dart';
import 'package:fyp_project/blocs/signup/signup_event.dart';
import 'package:fyp_project/config/Components/CustomTextFeild.dart';
import 'package:fyp_project/utils/validation.dart';

class SignUpEmailTextFeild extends StatelessWidget {
  const SignUpEmailTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.email!=current.email,
      builder: (context, state) {   
        return CustomTextFormField(
          label: "Email",
          prefixIcon: Icons.email_outlined,
          onChanged: (email) {
             context.read<SignupBloc>().add(OnChangedEmailEvent(email: email!));
          },
          onValidation: AppValidations.validateEmail,
        );
      },
    );
  }
}
