import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:my_chef/models/mid_nav_bar.dart';
import 'package:provider/provider.dart';

class MiddleNavBar extends StatelessWidget {
  MiddleNavBar({required this.titles});

  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    final MidNavBar midNavBar = Provider.of<MidNavBar>(context);

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            child: DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabBar(
                    onTap: (int newIndex) {
                      midNavBar.updateIndex(newIndex);
                    },
                    labelPadding: EdgeInsets.only(bottom: 4),
                    tabs: [
                      Text(
                        'My Recipes',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Liked',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                    indicator: ContainerTabIndicator(
                      color: Colors.teal,
                      widthFraction: .8,
                      height: 20,
                      radius: BorderRadius.circular(10),
                      padding: const EdgeInsets.only(top: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
