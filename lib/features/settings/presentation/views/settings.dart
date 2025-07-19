import 'package:books_reading/features/settings/presentation/views/widget/dark_or_light_button.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const routeName = 'settings';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: DarkOrLightButton(),
          ),
        ),
      ),
    );
  }
}
