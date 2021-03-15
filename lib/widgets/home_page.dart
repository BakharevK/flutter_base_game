import 'package:flutter/material.dart';

import 'settings_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextButton(
        child: Text(
          "New Game",
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            SettingsPage.routeName,
          );
        },
      ),
    );
  }
}
