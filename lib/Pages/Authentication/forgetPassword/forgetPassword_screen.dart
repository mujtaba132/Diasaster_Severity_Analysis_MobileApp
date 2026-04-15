import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Authentication/custom_widgets.dart/auth_content.dart';
import 'package:fyp_project/Pages/Authentication/custom_widgets.dart/background_gradient.dart';
import 'package:fyp_project/Pages/Authentication/forgetPassword/card/forgetPasswordCard.dart';
import 'package:fyp_project/blocs/forgetpassword/forget_password_bloc.dart';
import 'package:fyp_project/main.dart';
import 'package:fyp_project/responsible/mediaquery.dart';

class ForgetpasswordScreen extends StatefulWidget {
  const ForgetpasswordScreen({super.key});

  @override
  State<ForgetpasswordScreen> createState() => _ForgetpasswordScreenState();
}

class _ForgetpasswordScreenState extends State<ForgetpasswordScreen>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late ForgetPasswordBloc _forgetPasswordBloc;

  @override
  void initState() {
    super.initState();

    _forgetPasswordBloc = ForgetPasswordBloc(getit());
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward(); // zoom OUT on open
  }

  @override
  void dispose() {
    _forgetPasswordBloc.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive screen = Responsive(context);
    return BlocProvider.value(
      value: _forgetPasswordBloc,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              BackgroundGradient(),

              ScaleTransition(
                scale: _scaleAnimation,
                child: SingleChildScrollView(
                  child: Padding(
                   padding: EdgeInsets.symmetric(
                        horizontal: screen.screenWidth() * 0.07,
                        vertical: screen.screenheight() * 0.04,
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         SizedBox(height: screen.screenheight() * 0.07),

                          AuthScreenContent(
                            title: 'Welcome Back',
                            subtitle: 'Continue your jounrey with us.',
                          ),

                          SizedBox(height: screen.screenheight() * 0.09),

                          Forgetpasswordcard(),
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
