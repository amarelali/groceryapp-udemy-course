import 'package:flutter/material.dart';

class Style{
  static ThemeData themeData(bool themeMode){
    return ThemeData(
      scaffoldBackgroundColor: themeMode ? Colors.black54 : Colors.white ,
      colorScheme: themeMode ?  ColorScheme.dark() : ColorScheme.light(),
      textTheme: const TextTheme(bodyText2: TextStyle(fontSize: 35)),
    );
  }

}