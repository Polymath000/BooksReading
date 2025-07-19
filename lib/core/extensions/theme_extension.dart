import 'package:flutter/material.dart';

extension ThemeDataX on ThemeData {
  bool isDark({required BuildContext context}) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
