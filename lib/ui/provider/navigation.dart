import 'package:flutter/cupertino.dart';
import 'package:my_chef/ui/screens/home/create_screen.dart';
import 'package:my_chef/ui/screens/home/profile_screen.dart';
import 'package:my_chef/ui/screens/home/recipe_screen.dart';

class Navigation extends ChangeNotifier {
  int _index = 0;

  List screens = [
    RecipesScreen(),
    CreateScreen(),
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
