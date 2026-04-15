import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/login/login_bloc.dart';
import 'package:fyp_project/config/Components/CustomSnackbar.dart';
import 'package:fyp_project/config/Components/Custom_Btns.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/utils/enums.dart';

class LoginSubmitBtn extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  const LoginSubmitBtn({super.key, required this.formkey});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.loginStatus != current.loginStatus,
      listener: (context, state) {
             if(state.loginStatus==LoginStatus.error)
             {
                 CustomSnackBar.error(state.error.toString());
             }
             else if(state.loginStatus == LoginStatus.success)
             {
                 Navigator.pushNamed(context, RoutesName.homeScreen);
             }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>previous.loginStatus != current.loginStatus,
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            height: 55,
            child: Theme_Button(
              height: 40,
              width: double.infinity,
              textColor: Colors.white,
              text: "Login",
              bgColor: theme.colorScheme.primary,
              isLoading: state.loginStatus == LoginStatus.loading
                  ? true
                  : false,
              onclick: () async {
                if (formkey.currentState!.validate()) {
                  print("Form Validated Successfully!");
                  context.read<LoginBloc>().add(OnFormSubmitEvent());
                }
              },
            ),
          );
        },
      ),
    );
  }
}
