import 'package:breaking_bad/core/theme_app.dart';
import 'package:breaking_bad/pages/characters_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeApp,
      home: CharactersPage(),
    );
  }
}

