import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_chef/app/screens/home/profile/provider/drawer_controller.dart';
import 'package:my_chef/app/screens/home/profile/widgets/middle_nav_bar.dart';
import 'package:my_chef/app/screens/home/profile/widgets/middle_nav_bar_display.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView();
  // Use SilverAppBar
  // ! Images to storage
  // ! flutter image compress

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ZoomDrawerController drawerController =
        context.read<DrawerControllerProvider>().drawerController;

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Center(child: Text('My Chef')),
        actions: [
          IconButton(
            onPressed: () {
              drawerController.toggle!();
            },
            icon: Icon(Icons.settings),
          ),
          SizedBox(width: 6),
        ],
      ),
      body: SingleChildScrollView(
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
                        const MiddleNavBarDisplay(),
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
      ),
    );
  }
}
