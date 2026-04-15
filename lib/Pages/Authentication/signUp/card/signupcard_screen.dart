import 'package:flutter/material.dart';
import 'package:fyp_project/Pages/Authentication/signUp/card/widgets/confirmpasswordTextFeild.dart';
import 'package:fyp_project/Pages/Authentication/signUp/card/widgets/emailTextFeild.dart';
import 'package:fyp_project/Pages/Authentication/signUp/card/widgets/passwordTextFeild.dart';
import 'package:fyp_project/Pages/Authentication/signUp/card/widgets/submit_Btn.dart';

class SignUpCard extends StatefulWidget {


   const SignUpCard({super.key});

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
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

            SignUpEmailTextFeild(),

            const SizedBox(height: 20),

            SignUpPasswordTextFeild(),

            const SizedBox(height: 10),

            SignUpConfirmPasswordTextFeild(),

            const SizedBox(height: 30),

            SignUpSubmitBtn(formkey: formKey),

          ],
        ),
      ),
    );
  }
}
