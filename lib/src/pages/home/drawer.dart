import 'package:flutter/material.dart';
import 'package:flutter_demo/src/settings/settings_view.dart';
import 'package:flutter_demo/src/theme/colors.dart';

/// This drawer is displayed when the hamburger on in the home page appbar
/// is pressed, or if we touch the right side of the screen
Drawer getHomeRightDrawer(BuildContext context) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.accent,
            ),
            child: Text(''),
          ),
          Column(
            children: [
              ListTile(
                title: const Text('Settings'),
                onTap: () {
                  // Navigate to the settings page. If the user leaves and returns
                  // to the app after it has been killed while running in the
                  // background, the navigation stack is restored.
                  Navigator.of(context).pop(); // close the drawer
                  Navigator.restorablePushNamed(context, SettingsView.routeName);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
