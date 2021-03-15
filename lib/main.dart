import 'package:flutter/material.dart';
import 'widgets/game_page.dart';
import 'widgets/home_page.dart';
import 'widgets/settings_page.dart';

void main() {
  runApp(MyApp());
}

/***
    - start game screen (button "BEGIN")
    - configure screen (number of bots + number of rocks)
    - game screen (game + buttons with turn + info about player)
    - game over screen
 ***/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == HomePage.routeName) {
          return MaterialPageRoute(
            builder: (context) => HomePage(),
          );
        }
        if (settings.name == SettingsPage.routeName) {
          return MaterialPageRoute(
            builder: (context) => SettingsPage(),
          );
        }
        if (settings.name == GamePage.routeName) {
          GamePageArguments args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => GamePage(args),
          );
        }
        // if (settings.name == GameOverPage.routeName) {
        //
        // }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      home: HomePage(),
    );
  }
}
