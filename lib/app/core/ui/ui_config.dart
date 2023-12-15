import 'package:flutter/material.dart';

class UiConfig {
  static String get title => 'Cuidapet';
  static ThemeData get theme => ThemeData(
      primaryColor: const Color(0xffA8CE4B),
      primaryColorDark: const Color(0xff689F38),
      primaryColorLight: const Color(0xffDDE9C7),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffA8CE4B),
      ));
}
