import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/login/login_bloc.dart';
import 'package:fyp_project/config/Components/CustomSnackbar.dart';
import 'package:fyp_project/config/Components/Custom_Btns.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/utils/enums.dart';

class GoogleloginBtn extends StatelessWidget {
  const GoogleloginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.googleLoginStatus!=current.googleLoginStatus,
      listener: (context, state) {
          print('listening the Google SignIn BTN....');
          
           if(state.googleLoginStatus == GoogleLoginStatus.error)
           {
               CustomSnackBar.error(state.error.toString());
           }
           else if(state.googleLoginStatus == GoogleLoginStatus.success)
           { 
              Navigator.pushNamed(context, RoutesName.homeScreen);
           }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.googleLoginStatus!=current.googleLoginStatus,
        builder: (context, state) {
          print('building the Google SignIn BTN....');
          return Theme_Button(
            bgColor: theme.colorScheme.primary,
            borderColor: theme.colorScheme.primary,
            textColor: Colors.white,
            height: 50,
            width: double.infinity,
            text: 'SignIn With Google',
            iconImg: 'Assets/Images/Google.svg',
            isLoading: state.googleLoginStatus == GoogleLoginStatus.loading ? true : false,
            onclick: () {
                context.read<LoginBloc>().add(OnGoogleSignInEvent());
            },
          );
        },
      ),
    );
  }
}
