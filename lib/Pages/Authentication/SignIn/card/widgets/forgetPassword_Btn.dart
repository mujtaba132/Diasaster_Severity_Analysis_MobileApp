import 'package:flutter/material.dart';
import 'package:fyp_project/config/routes/routes_name.dart';

class ForgetpasswordBtn extends StatelessWidget {
  const ForgetpasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
               Navigator.pushNamed(context, RoutesName.forgetPasswordScreen);
               },
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
