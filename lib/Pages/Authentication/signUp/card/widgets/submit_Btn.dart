import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/signup/signup_bloc.dart';
import 'package:fyp_project/blocs/signup/signup_event.dart';
import 'package:fyp_project/config/Components/CustomSnackbar.dart';
import 'package:fyp_project/config/Components/Custom_Btns.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/utils/enums.dart';

class SignUpSubmitBtn extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  const SignUpSubmitBtn({super.key, required this.formkey});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocListener<SignupBloc, SignupState>(
      listenWhen: (previous, current) => previous.signUpStatus != current.signUpStatus,
      listener: (context, state) {
             if(state.signUpStatus==SignUpStatus.error)
             {
                 CustomSnackBar.error(state.error.toString());
             }
             else if(state.signUpStatus == SignUpStatus.success)
             {
                 CustomSnackBar.success('Account Created Successfully');
                 Navigator.pushNamed(context, RoutesName.loginScreen);
             }
      },
      child: BlocBuilder<SignupBloc, SignupState>(
        buildWhen: (previous, current) =>previous.signUpStatus != current.signUpStatus,
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            height: 55,
            child: Theme_Button(
              height: 40,
              width: double.infinity,
              textColor: Colors.white,
              text: "SignUp",
              bgColor: theme.colorScheme.primary,
              isLoading: state.signUpStatus == SignUpStatus.loading ? true : false,
              onclick:() async {
                if (formkey.currentState!.validate()) {
                  context.read<SignupBloc>().add(OnFormSubmit());
                }
              },
            ),
          );
        },
      ),
    );
  }
}
