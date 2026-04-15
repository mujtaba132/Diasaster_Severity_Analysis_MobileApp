import 'package:flutter/material.dart';
import 'package:fyp_project/responsible/mediaquery.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive screen = Responsive(context);
    final ThemeData theme = Theme.of(context);

    return  Column(
                children: [
                  Container(
                    height: screen.screenheight() * 0.40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(60, 40),
                        bottomRight: Radius.elliptical(60, 40),
                        ),
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.primary.withOpacity(0.85),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ],
              );
  }
}