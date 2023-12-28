import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/app_colors.dart';
import '../utils/helpers.dart';

class HomeContent extends StatelessWidget {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true, // Make the app bar float
          snap: true, // Snap the app bar back into view
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search here...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(
                            color: Colors.grey, // Set border color
                            width: 1.0, // Set border width
                          ),
                        ),
                        child: Icon(Icons.notifications),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          expandedHeight: 90.0, // Adjust the height to fit your needs
          elevation: 0, // Remove shadow
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return buildProductCard(
                  context); // Call a method to build your product card
            },
            childCount: 10, // Number of product cards you have
          ),
        ),
      ],
    );
  }

  Widget buildProductCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        // height: screenHeight(context) * 0.35,
        color: Color(0xfff8f8f8),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Indian Bollywood Art Silk Sari',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/icons/Icons.svg'),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset('assets/icons/more_vert.svg'),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: screenHeight(context) * 0.25,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                      12), // Rounded border with 12 pixels radius
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 4,
                effect: SlideEffect(
                  activeDotColor: greenColor,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aza Fashion',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/star.svg'),
                          SizedBox(
                            width: 8,
                          ),
                          Text('4.9'),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$ 40,00",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "\$ 50,00",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
