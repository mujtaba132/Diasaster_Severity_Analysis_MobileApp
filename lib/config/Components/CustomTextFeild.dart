import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final bool isPassword;
  final bool isObscurePassword;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final VoidCallback? onPasswordVisible;
  final Function(String? value)? onChanged;
  final String? Function(String? value) onValidation;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.isPassword = false,
    required this.onChanged,
    this.onPasswordVisible,
    this.inputFormatters,
    this.textInputType,
    this.isObscurePassword=true,
    required this.onValidation,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      obscureText: isPassword? isObscurePassword : false,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon, color: Colors.grey),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isObscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: onPasswordVisible
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),
     validator: onValidation,
     onChanged: onChanged,
    );
  }
}




