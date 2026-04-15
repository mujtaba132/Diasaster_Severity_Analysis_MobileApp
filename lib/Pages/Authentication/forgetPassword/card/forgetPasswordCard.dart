import 'package:flutter/material.dart';
import 'package:fyp_project/Pages/Authentication/forgetPassword/card/animatedContainer.dart';
import 'package:fyp_project/Pages/Authentication/forgetPassword/widgets/emailTextFeild.dart';
import 'package:fyp_project/Pages/Authentication/forgetPassword/widgets/submit_Btn.dart';

class Forgetpasswordcard extends StatefulWidget {


   const Forgetpasswordcard({super.key});

  @override
  State<Forgetpasswordcard> createState() => _ForgetpasswordcardState();
}

class _ForgetpasswordcardState extends State<Forgetpasswordcard> {
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

            ForgetAnimatedContainer(),

            ForgetPasswordEmailFeild(),

            const SizedBox(height: 20),

            ForgetsubmitBtn(formkey: formKey),

          ],
        ),
      ),
    );
  }
}
