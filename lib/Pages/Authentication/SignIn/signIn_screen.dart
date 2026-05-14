import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Authentication/SignIn/card/logincard_screen.dart';
import 'package:fyp_project/Pages/Authentication/custom_widgets.dart/auth_content.dart';
import 'package:fyp_project/Pages/Authentication/custom_widgets.dart/background_gradient.dart';
import 'package:fyp_project/Pages/Authentication/custom_widgets.dart/screen_Switch.dart';
import 'package:fyp_project/blocs/login/login_bloc.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/main.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();

    _loginBloc = getit<LoginBloc>();

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
    _loginBloc.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final horizontalPadding = size.width * 0.07;

    return BlocProvider.value(
      value: _loginBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              BackgroundGradient(),

              ScaleTransition(
                scale: _scaleAnimation,
                child: SingleChildScrollView(
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
                          title: 'Welcome Back',
                          subtitle: 'Continue your jounrey with us.',
                        ),

                        SizedBox(height: size.height * 0.10),

                        LoginCard(),

                        SizedBox(height: size.height * 0.05),

                        ScreenSwitch(
                          title: "Dont have an account? ",
                          btnName: 'Create Account',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.signupScreen,
                            );
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
