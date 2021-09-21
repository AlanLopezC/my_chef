import 'package:flutter/cupertino.dart';
import 'package:my_chef/app/screens/home/create/create_controller.dart';
import 'package:my_chef/app/screens/home/feed/feed_view.dart';
import 'package:my_chef/app/screens/home/profile/profile_controller.dart';

class Navigation extends ChangeNotifier {
  int _index = 0;

  List<Widget> screens = [
    FeedView(),
    CreateController(),
    ProfileController(),
  ];

  int getIndex() {
    return _index;
  }

  void updateIndex(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }

  // Widget getCurrentScreen() {
  //   return screens[_index];
  // }
}
