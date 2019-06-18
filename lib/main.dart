import 'package:anyunit/bloc/bloc.dart';
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
      home: MyHomePage(title: 'AnyUnit'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// controller for the value input field
  final TextEditingController valueController = TextEditingController();

  /// bloc for the unit conversion
  final ConverterBloc bloc = ConverterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, ConverterState state) {
        return Scaffold();
      },
    );
  }

  /// dispose controller and bloc
  @override
  void dispose() {
    valueController.dispose();
    bloc.dispose();
    super.dispose();
  }
}
