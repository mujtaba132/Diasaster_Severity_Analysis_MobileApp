import 'package:flutter/material.dart';
import 'package:fyp_project/Pages/Authentication/SignIn/card/widgets/emailTextFeild.dart';
import 'package:fyp_project/Pages/Authentication/SignIn/card/widgets/forgetPassword_Btn.dart';
import 'package:fyp_project/Pages/Authentication/SignIn/card/widgets/passwordTextFeild.dart';
import 'package:fyp_project/Pages/Authentication/SignIn/card/widgets/submit_Btn.dart';

class LoginCard extends StatefulWidget {


   const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
   final  formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: theme.brightness == Brightness.dark
                ? Colors.black54
                : Colors.black12,
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SignInEmailTextFeild(),

            const SizedBox(height: 20),

            SignInPasswordTextFeild(),

            const SizedBox(height: 10),

            ForgetpasswordBtn(),

            const SizedBox(height: 30),

            LoginSubmitBtn(formkey: formKey),

          ],
        ),
      ),
    );
  }
}
