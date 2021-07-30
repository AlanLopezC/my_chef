import 'package:flutter/foundation.dart';

class MidNavBar extends ChangeNotifier {
  int _index = 0;

  int getIndex() {
    return _index;
  }

  void updateIndex(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }
}
