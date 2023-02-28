import 'package:flutter/material.dart';
import 'package:grocery_app_course/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          value: context.watch<DarkThemeProvider>().getDarkTheme,
          title: const Text('Change Theme'),
          onChanged: (bool value) {
            context.read<DarkThemeProvider>().setDarkTheme = value;
          },
        ),
      ),
    );
  }
}
