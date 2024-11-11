
import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier{
  late ThemeData themeData;

  ThemeManager(this.themeData);

  ThemeData getTheme()=>themeData;

  void setTheme(ThemeData themeDatas) {
    themeData = themeDatas;
    notifyListeners();
  }

}













