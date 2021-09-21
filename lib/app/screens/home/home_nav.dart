import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_chef/app/screens/home/profile/provider/drawer_controller.dart';
import 'package:my_chef/app/screens/home/profile/settings/settings_controller.dart';
import 'package:my_chef/app/screens/home/provider/navigation.dart';
import 'package:my_chef/app/screens/home/widgets/costum_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeNav extends StatelessWidget {
  Widget build(BuildContext context) {
    final Navigation navigation = Provider.of<Navigation>(context);
    final ZoomDrawerController drawerController =
        context.read<DrawerControllerProvider>().drawerController;

    return ZoomDrawer(
      style: DrawerStyle.Style1,
      controller: drawerController,
      menuScreen: SettingsController(),
      mainScreen: Scaffold(
        body: IndexedStack(
          index: navigation.getIndex(),
          children: navigation.screens,
        ),
        bottomNavigationBar: CostumNavBar(),
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: -6.0,
      backgroundColor: Colors.grey.shade300,
      slideWidth: MediaQuery.of(context).size.width * .50,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.fastOutSlowIn,
      isRtl: true,
    );
  }
}
