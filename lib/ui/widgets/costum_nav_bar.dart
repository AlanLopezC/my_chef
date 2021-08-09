import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:my_chef/ui/navigation.dart';
import 'package:provider/provider.dart';

class CostumNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Navigation navigation = Provider.of<Navigation>(context);
    return SnakeNavigationBar.color(
      behaviour: SnakeBarBehaviour.pinned,
      snakeShape: SnakeShape.indicator,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.teal[200],
      currentIndex: navigation.getIndex(),
      onTap: (index) {
        if (index != navigation.getIndex()) {
          navigation.updateIndex(index);
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
