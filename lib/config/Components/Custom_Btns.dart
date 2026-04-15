// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: camel_case_types
class Theme_Button extends StatelessWidget {
  final Color textColor;
  final Color? borderColor;
  final Color bgColor;
  final String text;
  final IconData? icon;
  final String? iconImg;
  final double height;
  final double width;
  final VoidCallback onclick;
  final bool isLoading; 

  const Theme_Button({
    super.key,
    required this.text,
    required this.textColor,
    this.icon,
    this.iconImg,
    required this.height,
    required this.width,
    this.borderColor,
    required this.bgColor,
    required this.onclick,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onclick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: borderColor != null
              ? Border.all(width: 1, color: borderColor!)
              : null,
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null)
                      Icon(icon, color: textColor, size: 20)
                    else if (iconImg != null)
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(iconImg!),
                      ),
                    if (icon != null || iconImg != null)
                      const SizedBox(width: 12),
                    Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class CustomAnimatedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final FontWeight fontWeight;
  final Duration duration;
  final Curve curve;
  final Color? shadowColor;
  final double elevation;

  const CustomAnimatedButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = const Color.fromRGBO(36, 69, 206, 1),
    this.borderRadius = 20,
    this.padding = const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
    this.fontSize = 17,
    this.fontWeight = FontWeight.w600,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
    this.shadowColor,
    this.elevation = 6,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      curve: curve,
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: shadowColor ?? backgroundColor.withOpacity(0.4),
          elevation: elevation,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
