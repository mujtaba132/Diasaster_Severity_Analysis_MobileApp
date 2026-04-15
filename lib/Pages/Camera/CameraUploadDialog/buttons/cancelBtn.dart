import 'package:flutter/material.dart';
import 'package:fyp_project/config/Components/Custom_Btns.dart';

class Cancelbtn extends StatelessWidget {
  final VoidCallback onPressed;
  const Cancelbtn({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  Expanded(
            child: Theme_Button( 
              bgColor: Colors.transparent,
              textColor: theme.primaryColor,
              borderColor: theme.primaryColor,
              height: 42,
              width: double.infinity,
              text: 'Cancel',
              onclick: onPressed
            ),
          );
  }
}