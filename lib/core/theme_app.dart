import 'package:flutter/material.dart';

final themeApp = ThemeData(
  primarySwatch: Colors.green,
  appBarTheme: AppBarTheme(color: Colors.green[900]),
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
