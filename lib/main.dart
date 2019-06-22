import 'package:anyunit/view/inputscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnyUnit',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        accentColor: Colors.redAccent,
      ),
      home: InputScreen(),
    );
  }
}
