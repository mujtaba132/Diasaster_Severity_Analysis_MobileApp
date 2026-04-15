import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/signup/signup_bloc.dart';
import 'package:fyp_project/blocs/signup/signup_event.dart';
import 'package:fyp_project/config/Components/CustomTextFeild.dart';
import 'package:fyp_project/utils/validation.dart';

class SignUpConfirmPasswordTextFeild extends StatelessWidget {

  const SignUpConfirmPasswordTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) =>
       previous.confirmPassword!=current.confirmPassword || 
       previous.isObscureConfirmPassword!=current.isObscureConfirmPassword,
      builder: (context, state) {   
        return CustomTextFormField(
          label: "Confirm Password",
          prefixIcon: Icons.password,
          isPassword: true,
          isObscurePassword: state.isObscureConfirmPassword,
          onPasswordVisible: () {
               context.read<SignupBloc>().add(OnConfirmPasswordVisiblityEvent());
          },
          onChanged: (value) {
             context.read<SignupBloc>().add(OnChangedConfirmPasswordEvent(confirmPassword: value!.trim()));
          },
          onValidation: AppValidations.validatePassword,
        );
      },
    );
  }
}
