import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/signup/signup_bloc.dart';
import 'package:fyp_project/blocs/signup/signup_event.dart';
import 'package:fyp_project/config/Components/CustomTextFeild.dart';
import 'package:fyp_project/utils/validation.dart';

class SignUpPasswordTextFeild extends StatelessWidget {

  const SignUpPasswordTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) =>
       previous.password!=current.password || 
       previous.isObscurePassword!=current.isObscurePassword,
      builder: (context, state) {   
        return CustomTextFormField(
          label: "Password",
          prefixIcon: Icons.password,
          isPassword: true,
          isObscurePassword: state.isObscurePassword,
          onPasswordVisible: () {
               context.read<SignupBloc>().add(OnPasswordVisiblityEvent());
          },
          onChanged: (value) {
             context.read<SignupBloc>().add(OnChangedPasswordEvent(password: value!.trim()));
          },
          onValidation: AppValidations.validatePassword,
        );
      },
    );
  }
}
