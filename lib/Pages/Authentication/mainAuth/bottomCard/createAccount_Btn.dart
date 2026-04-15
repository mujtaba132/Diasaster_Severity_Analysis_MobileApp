import 'package:flutter/material.dart';
import 'package:fyp_project/config/Components/Custom_Btns.dart';
import 'package:fyp_project/config/routes/routes_name.dart';

class CreateaccountBtn extends StatelessWidget {
  const CreateaccountBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);      
    
    return Theme_Button(
          bgColor: Colors.transparent,
          borderColor: theme.colorScheme.primary,
          textColor: theme.colorScheme.primary,
          height: 50,
          width: double.infinity,
          text: 'Create Account',
          icon: Icons.email_outlined,
          onclick: () {         
                 Navigator.pushNamed(context, RoutesName.signupScreen);
          },
        );
  }
}
