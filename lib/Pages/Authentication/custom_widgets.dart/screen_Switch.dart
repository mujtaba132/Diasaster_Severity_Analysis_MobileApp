import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScreenSwitch extends StatelessWidget {
  final String title;
  final String btnName;
  final Function onTap;
  const ScreenSwitch({
    super.key,
    required this.title,
    required this.btnName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: RichText(
        text: TextSpan(
          style: theme.textTheme.bodyMedium,
          text: title,
          children: [
            TextSpan(
              text: btnName,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onTap;
                },
            ),
          ],
        ),
      ),
    );
  }
}
