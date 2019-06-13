import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnyUnit',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[800],
        canvasColor: Colors.blueGrey[700],
        accentColor: Colors.yellow,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.arrow_forward),
        label: Text(
          "CONVERT",
        ),
        onPressed: null,
      ),
    );
  }
}
