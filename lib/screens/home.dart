import 'package:flutter/material.dart';
import 'package:my_chef/components/costum_nav_bar.dart';
import 'package:my_chef/models/navigation.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    final Navigation navigation = Provider.of<Navigation>(context);

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Center(child: Text('My Chef')),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send_rounded),
          ),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: navigation.getCurrentScreen(),
      bottomNavigationBar: CostumNavBar(),
    );
  }
}
