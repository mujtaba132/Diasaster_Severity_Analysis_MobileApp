import 'package:flutter/material.dart';

class AppSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String hintText;

  const AppSearchField({
    super.key,
    required this.controller,
    this.onChanged,
    this.hintText = "Search...",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return  TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColor.withOpacity(0.5))
          ),
          prefixIcon: Icon(
            Icons.search,
            color: isDark ? Colors.white70 : Colors.black54,
          ),

          suffixIcon: controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    controller.clear();
                    onChanged?.call('');
                  },
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color:
                        isDark ? Colors.white60 : Colors.black45,
                  ),
                )
              : null,

          hintText: hintText,
          hintStyle: TextStyle(
            color:
                isDark ? Colors.white38 : Colors.black38,
          ),
        ),
      );

  }
}