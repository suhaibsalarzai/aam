import 'package:aam/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  CustomElevatedButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      // color: greenColor,
      width: screenWidth * 0.8,
      height: 50.0,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: "Jost",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            // optional: rounded corners
          ),
        ),
      ),
    );
  }
}
