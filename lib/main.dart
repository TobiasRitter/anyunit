import 'package:cleverconvert/view/inputscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CleverConvertApp());

class CleverConvertApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CleverConvert',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        accentColor: Colors.greenAccent,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        canvasColor: Colors.black,
        accentColor: Colors.greenAccent,
      ),
      home: InputScreen(),
    );
  }
}
