import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Authentication/custom_widgets.dart/auth_content.dart';
import 'package:fyp_project/Pages/Authentication/custom_widgets.dart/background_gradient.dart';
import 'package:fyp_project/Pages/Authentication/custom_widgets.dart/screen_Switch.dart';
import 'package:fyp_project/Pages/Authentication/signUp/card/signupcard_screen.dart';
import 'package:fyp_project/blocs/signup/signup_bloc.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/main.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late SignupBloc _signUpBloc;

  @override
  void initState() {
    super.initState();

    _signUpBloc=getit<SignupBloc>();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    ); 

    _scaleAnimation = Tween<double>(
      begin: 1.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _signUpBloc.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width * 0.07;

    return BlocProvider.value(
      value: _signUpBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [

              BackgroundGradient(),

              ScaleTransition(
                scale: _scaleAnimation,
                child:  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: size.height * 0.04,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(height: size.height * 0.07),

                          AuthScreenContent(
                            title: 'Create Account',
                            subtitle: 'Continue your jounrey with us.',
                          ),

                          SizedBox(height: size.height * 0.10),

                          SignUpCard(),

                          SizedBox(height: size.height * 0.05),

                          ScreenSwitch(
                            title: "Already have an account? ",
                            btnName: 'SIGNIN',
                            onTap: () {
                                  Navigator.pushNamed(context, RoutesName.loginScreen);
                            },
                          ),

                          SizedBox(height: size.height * 0.05),

                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
