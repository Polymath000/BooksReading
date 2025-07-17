
import 'package:books_reading/features/home/presentation/views/home.dart';
import 'package:books_reading/features/settings/presentation/views/settings.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(final RouteSettings settings) =>
    switch (settings.name) {
      HomeView.routeName => MaterialPageRoute(
        builder: (_) =>  HomeView(),
      ),
      SettingsView.routeName => MaterialPageRoute(
        builder: (_) => const SettingsView(),
      ),      
      _ => MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Page not found'))),
      ),
    };
