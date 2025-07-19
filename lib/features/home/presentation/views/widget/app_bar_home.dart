import 'package:books_reading/core/utls/app_colors.dart';
import 'package:books_reading/core/utls/app_text_style.dart';
import 'package:books_reading/features/settings/presentation/views/settings.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120,
      toolbarHeight: 40,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'My Books',
          style: AppTextStyles.titleLarge!.copyWith(color: AppColors.black),
        ),
      ),
      backgroundColor: AppColors.lightGrey,
      shadowColor: AppColors.black,
      surfaceTintColor: AppColors.grey,
      floating: true,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, SettingsView.routeName);
          },
          icon: Icon(Icons.settings, color: AppColors.black),
        ),
      ],

      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.white),
      ),
    );
  }
}
