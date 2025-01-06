import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'animated_box_widget.dart';

const key = 'animationBoxReordableList';

class AnimatedBoxesProvider extends ChangeNotifier {
  final SharedPreferences pref;

  AnimatedBoxesProvider({required this.pref}) {
    getList();
  }

  late List<int> animationBoxReordableList;

  void getList() {
    final list = pref.getStringList(key);

    if (list != null && list.isNotEmpty) {
      animationBoxReordableList = list.map((e) => int.parse(e)).toList();
    } else {
      animationBoxReordableList =
          List.generate(AnimationType.values.length, (index) => index);
    }

    notifyListeners();
  }

  void saveList(List<int> list) {
    pref.setStringList(key, list.map((e) => e.toString()).toList());
    animationBoxReordableList = list;
    notifyListeners();
  }
}
