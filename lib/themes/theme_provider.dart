import 'package:flutter/material.dart';
import 'package:ticket_app/themes/dark_mode.dart';
import 'package:ticket_app/themes/light_mode.dart';


class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;


  void setThemeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();

  }

  void toggleTheme(){
    if(_themeData == lightMode){
      setThemeData(darkMode);
    }else{
      setThemeData(lightMode);
    }
  }


}

