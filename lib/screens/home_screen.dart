import 'package:aam/screens/home_content.dart';
import 'package:aam/screens/settings_Screen.dart';
import 'package:aam/screens/shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_colors.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _controller = PageController();
  final _controllerPages = PageController();

  final List<Widget> _pages = [
    HomeContent(),
    ShoppingScreen(),
    CartScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGO'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      bottomNavigationBar: buildBottomAppBar(),
      floatingActionButton:
          buildFloatingActionButton(), // Extracted method for building FloatingActionButton
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildIcon(int index, String iconAsset, String label) {
    return FittedBox(
      child: Column(
        children: [
          IconButton(
            onPressed: () => _onItemTapped(index),
            icon: SvgPicture.asset(
              iconAsset,
              width: 30,
              color: _selectedIndex == index
                  ? greenColor
                  : null, // Conditional color
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? greenColor : null,
            ),
          )
        ],
      ),
    );
  }

  Widget buildBottomAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildIcon(0, 'assets/icons/home.svg', 'Home'),
            buildIcon(1, 'assets/icons/bag.svg', 'Shopping'),
            SizedBox(
              width: 30,
            ),
            buildIcon(2, 'assets/icons/shopping-cart.svg', 'Cart'),
            buildIcon(3, 'assets/icons/setting-2.svg', 'Settings'),
          ],
        ),
      ),
    );
  }

  Widget buildFloatingActionButton() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          elevation: 0,
          shape: CircleBorder(),
        ),
      ),
    );
  }
}

/*

import 'package:aam/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('NewsFeed',
                  style: Theme.of(context).textTheme.headline6),
            ),
            Card(
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
                      controller: _controller,
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('2 Days ago', style: TextStyle(fontSize: 16)),
            ),
            Card(
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
                      controller: _controller,
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
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FittedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/home.svg',
                          width: 30,
                        ),
                      ),
                      Text(
                        'Home',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/bag.svg',
                          width: 30,
                        ),
                      ),
                      Text('Shopping')
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                FittedBox(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/shopping-cart.svg',
                          width: 30,
                        ),
                      ),
                      Text('Cart')
                    ],
                  ),
                ),
                FittedBox(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/setting-2.svg',
                          width: 30,
                        ),
                      ),
                      Text('Settings'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          elevation: 0,
          shape: CircleBorder(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
*/
