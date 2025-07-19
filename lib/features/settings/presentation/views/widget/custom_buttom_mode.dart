import 'package:flutter/material.dart';

class CustomButtomMode extends StatelessWidget {
  const CustomButtomMode({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.onPressed,
  });
  final String text;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isSelected = (text == "Dark" && isDark) || (text == "Light" && !isDark);

    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 37),
        height: 48,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: isSelected
                ? Colors.blue
                : Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey),
              borderRadius: borderRadius,
            ),
          ),
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
