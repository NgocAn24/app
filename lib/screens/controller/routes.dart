// routes.dart
import 'package:education/screens/controller/panel/ExpandScreen.dart';
import 'package:education/screens/controller/panel/MyLearningScreen.dart';
import 'package:education/screens/controller/panel/Settings.dart';
import 'package:education/screens/controller/panel/home_screen.dart';
import 'package:flutter/material.dart';


class Routes {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      '/home': (context) => HomeScreen(),
      '/my_learning': (context) => MyLearningScreen(),
      '/expand': (context) => ExpandScreen(),
      '/settings': (context) => Settings(),
    };
  }
}




