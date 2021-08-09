import 'package:flutter/cupertino.dart';
import 'package:my_chef/ui/screens/create_screen.dart';
import 'package:my_chef/ui/screens/profile_screen.dart';
import 'package:my_chef/ui/screens/recipe_screen.dart';

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
