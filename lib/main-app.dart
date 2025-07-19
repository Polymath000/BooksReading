import 'package:books_reading/core/helpers/on_generate_routes.dart';
import 'package:books_reading/core/theme/dark_and_light_mode/cubit/dark_mode_cubit.dart';
import 'package:books_reading/core/utls/app_colors.dart';
import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:books_reading/features/home/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookReading extends StatelessWidget {
  const BookReading({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, DarkModeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: state is DarkModeDark ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          initialRoute: HomeView.routeName,
          onGenerateRoute: onGenerateRoute,
          builder: (context, child) {
            AppColors.init(context);
            AppTextStyles.init(context);
            return child!;
          },
        );
      },
    );
  }
}
