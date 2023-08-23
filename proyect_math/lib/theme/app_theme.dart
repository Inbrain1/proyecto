import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static final ThemeData indigoTheme = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
    //AppBarTheme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    cardTheme:  CardTheme(
      color: Colors.purple.shade700,
      elevation: 3,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 30,
        shadows: [
          Shadow(
            color: Colors.purple.shade50.withOpacity(.3),
            offset: const Offset(3, 3),
            blurRadius: 5,
          )
        ],
      ),
      headline2: TextStyle(
        color: Colors.purple.shade50,
        fontSize: 20,
      ),
    bodyText1: TextStyle(
      color: Colors.purple.shade50,
      fontSize: 18
    )
    ),
  );
}
