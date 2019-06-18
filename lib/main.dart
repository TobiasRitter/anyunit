import 'package:flutter/material.dart';

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
  // TODO: load automatically
  List categories = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit),
      title: Text("Temperature"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.directions_walk),
      title: Text("Distance"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fitness_center),
      title: Text("Weight"),
    ),
  ];

  // TODO: load dynamically
  List items = <DropdownMenuItem>[
    DropdownMenuItem(
      value: "aaa",
      child: Text("aaa"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: categories,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(),
                ),
                DropdownButton(
                  onChanged: null,
                  value: items[0].value,
                  items: items,
                ),
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
