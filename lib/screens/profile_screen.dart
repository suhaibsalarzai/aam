import 'package:aam/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.pink,
                child: Text('AF',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
              ),
              SizedBox(height: 10),
              Text(
                'Aza Fashion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1F2024),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProfileButton(
                    context: context,
                    text: 'Follow',
                    backgroundColor: greenColor,
                    textColor: Colors.white,
                    onPressed: () {
                      // Implement button functionality
                    },
                  ),
                  SizedBox(width: 10),
                  _buildProfileButton(
                    context: context,
                    text: 'Message',
                    backgroundColor: Colors.white,
                    textColor: greenColor,
                    onPressed: () {
                      // Implement button functionality
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              _buildStatSection(context),
              _buildAboutSection(context),
            ]),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _buildProductItem(context,
                      index); // Implement this function to return each product item
                },
                childCount: 20, // Replace with the actual number of items
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileButton({
    required BuildContext context,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: screenWidth(context) * 0.3,
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: greenColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }

  Widget _buildStatColumn(
      BuildContext context, String assetName, String number, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffECF5F3)),
            child: SvgPicture.asset(
              assetName,
              width: 24,
              height: 24,
            ),
          ),
          Text(
            number,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight(context) * 0.14,
            width: double.maxFinite,
            child: Image.asset(
              'assets/images/p${index + 1}.png', // Replace with actual image URL
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$ 16.00', // Replace with actual product price
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Product Title $index\nThis is an Indian Bollywood art silk sari ', // Replace with actual product title and description
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  overflow:
                      TextOverflow.ellipsis, // Use ellipsis for text overflow
                  maxLines: 3, // For example, allow text to span up to 3 lines
                ),
                SizedBox(height: 5),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStatColumn(
              context, 'assets/icons/user.svg', '658+', 'Followers'),
          _buildStatColumn(
              context, 'assets/icons/ratingstar.svg', '4.8', 'Rating'),
          _buildStatColumn(
              context, 'assets/icons/Iconly.svg', '300+', 'Reviews'),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/sms.svg',
                width: 25,
                height: 25,
              ),
              SizedBox(width: 16),
              Text(
                'aza@example.com',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/location.svg',
                width: 25,
                height: 25,
              ),
              SizedBox(width: 16),
              Text(
                'Fairfield, US',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: 32,
            thickness: 1,
          ),
          Text(
            'All Products (20 items)',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/*



import 'package:aam/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.pink,
            child: Text(
              'AF',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Aza Fashion',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1F2024),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfileButton(
                context: context,
                text: 'Follow',
                backgroundColor: greenColor,
                textColor: Colors.white,
                onPressed: () {
                  // Implement button functionality
                },
              ),
              SizedBox(width: 10),
              _buildProfileButton(
                context: context,
                text: 'Message',
                backgroundColor: Colors.white,
                textColor: greenColor,
                onPressed: () {
                  // Implement button functionality
                },
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildStatColumn(
                  context, 'assets/icons/user.svg', '658+', 'Followers'),
              SizedBox(
                width: 15,
              ),
              _buildStatColumn(
                  context, 'assets/icons/ratingstar.svg', '4.8', 'Rating'),
              SizedBox(
                width: 15,
              ),
              _buildStatColumn(
                  context, 'assets/icons/Iconly.svg', '300+', 'Reviews'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 8),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/sms.svg',
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'aza@example.com',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          width: 25,
                          height: 25,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Fairfield, US',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Text(
                      'All Products (20 items)',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: 10, // Replace with the actual number of items
              itemBuilder: (context, index) {
                return _buildProductItem(context,
                    index); // Implement this function to return each product item
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileButton({
    required BuildContext context,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: screenWidth(context) * 0.3,
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: greenColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }

  Widget _buildStatColumn(
      BuildContext context, String assetName, String number, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffECF5F3)),
            child: SvgPicture.asset(
              assetName,
              width: 24,
              height: 24,
            ),
          ),
          Text(
            number,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight(context) * 0.14,
            width: double.maxFinite,
            child: Image.asset(
              'assets/images/p${index + 1}.png', // Replace with actual image URL
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$ 16.00', // Replace with actual product price
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Product Title $index\nThis is an Indian Bollywood art silk sari ', // Replace with actual product title and description
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  overflow:
                      TextOverflow.ellipsis, // Use ellipsis for text overflow
                  maxLines: 3, // For example, allow text to span up to 3 lines
                ),
                SizedBox(height: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}



 */
