import 'package:anyunit/bloc/bloc.dart';
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
        child: MyHomePage(title: 'AnyUnit'),
      ),
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
    return InputScreen();
  }
}

class ResultsScreen extends StatefulWidget {
  final String value;
  final String unit;

  /// a map of the results to display
  final Map<String, String> results;

  const ResultsScreen({
    Key key,
    @required this.value,
    @required this.unit,
    @required this.results,
  }) : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState(
        value: value,
        unit: unit,
        results: results,
      );
}

class _ResultsScreenState extends State<ResultsScreen> {
  /// bloc for the results screen
  ResultsScreenBloc bloc;

  final String value;
  final String unit;

  /// a map of the results to display
  final Map<String, String> results;

  _ResultsScreenState({
    @required this.value,
    @required this.unit,
    @required this.results,
  }) {
    bloc = ResultsScreenBloc(
      value: value,
      unit: unit,
      results: results,
    );
  }

  /// dispose bloc
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, ResultsScreenState state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text("${state.value} ${state.unit}"),
          ),
          body: ListView.builder(
            itemCount: state.results.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return ListTile(
                title: Text(
                  "${state.results.values.elementAt(index)} ${state.results.keys.elementAt(index)}",
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  /// bloc for the input screen
  final InputScreenBloc bloc = InputScreenBloc();

  /// controller for the value input field
  final TextEditingController valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    valueController
        .addListener(() => bloc.onValueChanged(valueController.text));
  }

  /// dispose controller and bloc
  @override
  void dispose() {
    valueController.dispose();
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, InputScreenState state) {
        valueController.text = state.value;
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: bloc.onCategoryChanged,
            currentIndex: state.categoryIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.fitness_center,
                ),
                title: Text(
                  state.categories.elementAt(0),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.ac_unit,
                ),
                title: Text(
                  state.categories.elementAt(1),
                ),
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Theme.of(context).accentColor,
                  child: Center(
                    child: TextField(
                      autofocus: true,
                      controller: valueController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration.collapsed(
                        hintText: "Enter a value",
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: DropdownButton(
                    value: state.unit,
                    onChanged: bloc.onUnitChanged,
                    items: state.units
                        .map((unit) => DropdownMenuItem<String>(
                              value: unit,
                              child: Text(unit),
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: Text(
              "CONVERT",
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsScreen(
                        value: valueController.text,
                        unit: bloc.converter.selectedUnit.name,
                        results: bloc.converter.convert(),
                      ),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_forward,
            ),
          ),
        );
      },
    );
  }
}
