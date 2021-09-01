import 'package:flutter/material.dart';
import 'package:my_chef/app/screens/home/profile/widgets/middle_nav_bar.dart';
import 'package:my_chef/app/screens/home/profile/widgets/middle_nav_bar_display.dart';

class ProfileScreen extends StatelessWidget {
  // Use SilverAppBar
  // ! Images to storage

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/profile_back.jpg',
                  width: double.infinity,
                  height: screenSize.height / 3,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alan Lopez',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Newbie Chef',
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 10),
                      MiddleNavBar(titles: []),
                      SizedBox(height: 14),
                      MiddleNavBarDisplay(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: screenSize.height / 3 - 46,
              left: screenSize.width / 2 - 46,
              child: CircleAvatar(
                radius: 46,
                backgroundImage: AssetImage(
                  'assets/images/profile_pic.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
