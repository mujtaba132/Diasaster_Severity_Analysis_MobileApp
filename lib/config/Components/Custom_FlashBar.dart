import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:fyp_project/Core/appkeys.dart';

class CustomFlushBar {
  static void show({
    required String message,
    Color? bgColor,
    Color textColor = Colors.white,
    IconData? icon,
    int duration = 3,
  }) {
    final context = AppKeys.navigatorKey.currentContext;

    if (context == null) return;

    Flushbar(
      messageText: Row(
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
      backgroundColor: bgColor ?? Colors.black87,
      margin: const EdgeInsets.all(12),
      borderRadius: BorderRadius.circular(14),
      duration: Duration(seconds: duration),
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 400),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeIn,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    ).show(context);
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