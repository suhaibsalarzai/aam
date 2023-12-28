import 'package:aam/screens/on_boarding_screen.dart';
import 'package:aam/utils/helpers.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/Splash.png',
        fit: BoxFit.cover,
        width: screenWidth(context),
        height: screenHeight(context),
      ),
    );
  }
}
