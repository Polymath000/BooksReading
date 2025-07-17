import 'package:books_reading/core/helpers/on_generate_routes.dart';
import 'package:books_reading/core/utls/app_colors.dart';
import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:books_reading/features/home/presentation/views/home.dart';
import 'package:flutter/material.dart';

class BookReading extends StatelessWidget {
  const BookReading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.routeName,
      onGenerateRoute: onGenerateRoute,
      builder: (context, child) {
        AppColors.init(context);
        AppTextStyles.init(context);
        return child!;
      },
    );
  }
}
