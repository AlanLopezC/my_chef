import 'package:flutter/cupertino.dart';
import 'package:my_chef/app/screens/home/create/create_controller.dart';
import 'package:my_chef/app/screens/home/profile/profile_screen.dart';
import 'package:my_chef/app/screens/home/recipes/recipe_screen.dart';

class Navigation extends ChangeNotifier {
  int _index = 0;

  List screens = [
    RecipesScreen(),
    CreateController(),
    ProfileScreen(),
  ];

  int getIndex() {
    return _index;
  }

  void updateIndex(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }

  dynamic getCurrentScreen() {
    return screens[_index];
  }
}
