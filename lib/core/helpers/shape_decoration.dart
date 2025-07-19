import 'package:books_reading/core/utls/app_colors.dart';
import 'package:flutter/material.dart';

ShapeDecoration get shapeDecoration => ShapeDecoration(
  color: AppColors.grey,
  shape: RoundedRectangleBorder(
    side: const BorderSide(color: Color(0xFFE5E7EB)),
    borderRadius: BorderRadius.circular(16),
  ),
  shadows: const [
    BoxShadow(color: Color(0x0C000000), blurRadius: 2, offset: Offset(0, 1)),
  ],
);
