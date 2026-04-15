import 'package:flutter/material.dart';
import 'package:fyp_project/Core/appkeys.dart';

class CustomSnackBar {
  static void show({
    required String message,
    Color? bgColor,
    Color textColor = Colors.white,
    IconData? icon,
    int duration = 3,
  }) {
    final messenger = AppKeys.scaffoldMessengerKey.currentState;

    messenger?.hideCurrentSnackBar();

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: bgColor ?? Colors.black87,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      duration: Duration(seconds: duration),
      content: Row(
        children: [
          if (icon != null) Icon(icon, color: textColor, size: 22),
          if (icon != null) const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );

    messenger?.showSnackBar(snackBar);
  }

  static void success(String message) {
    show(
      message: message,
      bgColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  static void error(String message) {
    show(
      message: message,
      bgColor: Colors.redAccent,
      icon: Icons.error,
    );
  }

  static void info(String message, {int time = 3}) {
    show(
      message: message,
      bgColor: Colors.blueAccent,
      icon: Icons.info,
      duration: time,
    );
  }
}