import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/login/login_bloc.dart';
import 'package:fyp_project/config/Components/CustomTextFeild.dart';
import 'package:fyp_project/utils/validation.dart';

class SignInPasswordTextFeild extends StatelessWidget {

  const SignInPasswordTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
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
               context.read<LoginBloc>().add(OnPasswordVisiblityEvent());
          },
          onChanged: (value) {
             context.read<LoginBloc>().add(OnChangedPasswordEvent(password: value!.trim()));
          },
          onValidation: AppValidations.validatePassword,
        );
      },
    );
  }
}
