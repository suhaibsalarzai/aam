import 'package:aam/constants/app_colors.dart';
import 'package:aam/screens/home_screen.dart';
import 'package:aam/utils/helpers.dart';
import 'package:aam/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: screenHeight(context) * 0.8,
            child: PageView(
              controller: _controller,
              children: [
                OnboardingPage(
                  imgPath: 'assets/images/path.svg',
                  text:
                      'Discover, Buy, and Sell with Ease. Create an account to get started.',
                ),
                OnboardingPage(
                  imgPath: 'assets/images/9.svg',
                  text:
                      'Discover, Buy, and Sell with Ease. Create an account to get started.',
                ),
                OnboardingPage(
                  imgPath: 'assets/images/14.svg',
                  text:
                      'Discover, Buy, and Sell with Ease. Create an account to get started.',
                ),
              ],
            ),
          ),
          //
          SizedBox(
            height: 30,
          ),
          Spacer(),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: greenColor,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CustomElevatedButton(
              buttonText: "Let's Get Started",
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imgPath;
  final String text;
  const OnboardingPage({required this.imgPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: SvgPicture.asset(
              imgPath,
              //width: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.contain,
              height: screenHeight(context) * 0.6,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Welcome to AAM',
            style: TextStyle(
              color: Color(0xFF262626),
              fontSize: 16,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF262626),
              fontSize: 16,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
