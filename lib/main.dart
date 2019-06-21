import 'package:anyunit/bloc/bloc.dart';
import 'package:anyunit/view/inputscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnyUnit',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.redAccent,
        accentColor: Colors.redAccent,
      ),
      home: BlocProvider(
        builder: (context) => InputScreenBloc(),
        child: InputScreen(),
      ),
    );
  }
}
