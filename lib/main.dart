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
  void initState() {
    super.initState();
    valueController
        .addListener(() => bloc.onValueChanged(valueController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, ConverterState state) {
        valueController.text = state.value.toString();
        return (state is InputState)
            ? Scaffold(
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
                  onPressed: bloc.onConvertPressed,
                  icon: Icon(
                    Icons.arrow_forward,
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: bloc.onBackPressed,
                  ),
                  title: Text("${state.value} ${state.unit}"),
                ),
                body: (state is ResultState)
                    ? ListView.builder(
                        itemCount: state.results.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return ListTile(
                            title: Text(
                              "${state.results.values.elementAt(index)} ${state.results.keys.elementAt(index)}",
                            ),
                          );
                        },
                      )
                    : null,
              );
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
