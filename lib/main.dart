import 'package:aam/constants/app_colors.dart';
import 'package:aam/screens/cart_screen.dart';
import 'package:aam/screens/home_screen.dart';
import 'package:aam/screens/home_screen1.dart';
import 'package:aam/screens/settings_Screen.dart';
import 'package:aam/screens/shopping_screen.dart';
import 'package:aam/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AAM',
      theme: ThemeData(
        primaryColor: greenColor,
        colorScheme: ColorScheme.light(
          primary: greenColor,
          secondary: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          color: Colors.white,
        ),
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/home1': (context) => HomeScreen1(),
        '/shopping': (context) => ShoppingScreen(),
        '/cart': (context) => CartScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
