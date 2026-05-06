import 'package:flutter/material.dart';

class ContainerIcon extends StatelessWidget {

  final IconData? icon;
  const ContainerIcon({super.key,this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.primaryColor.withOpacity(0.1),
                ),
                child: Icon(
                  icon ?? Icons.upload_file,
                  size: 40,
                  color: theme.primaryColor,
                ),
              );
  }
}