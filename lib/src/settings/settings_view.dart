import 'package:flutter/material.dart';

import 'settings_controller.dart';
import 'package:flutter_demo/src/theme/colors.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: (Theme.of(context).brightness == Brightness.dark)
            ? const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: FractionalOffset.centerRight,
                  colors: [AppColors.primary, AppColors.gradientLight],
                  stops: [0, 1],
                ),
              )
            : null,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              // Glue the SettingsController to the theme selection DropdownButton.
              //
              // When a user selects a theme from the dropdown list, the
              // SettingsController is updated, which rebuilds the MaterialApp.
              child: Row(
                children: [
                  DropdownButton<ThemeMode>(
                    // Read the selected themeMode from the controller
                    value: controller.themeMode,
                    // Call the updateThemeMode method any time the user selects a theme.
                    onChanged: controller.updateThemeMode,
                    items: const [
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text('System Theme'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text('Light Theme'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text('Dark Theme'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
