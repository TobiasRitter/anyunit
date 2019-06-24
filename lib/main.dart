import 'package:cleverconvert/view/inputscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CleverConvertApp());

class CleverConvertApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool light = true;
    return MaterialApp(
      title: 'CleverConvert',
      theme: light
          ? ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.white,
              canvasColor: Colors.white,
              accentColor: Colors.greenAccent,
            )
          : ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.black,
              canvasColor: Colors.black,
              accentColor: Colors.greenAccent,
            ),
      home: InputScreen(),
    );
  }
}
