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
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, ConverterState state) {
        return (state is InputState)
            ? Scaffold(
                bottomNavigationBar: BottomNavigationBar(
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
                      child: DropdownButton(
                        onChanged: null,
                        items: null,
                      ),
                    )
                  ],
                ),
                floatingActionButton: FloatingActionButton.extended(
                  label: Text(
                    "CONVERT",
                  ),
                  onPressed: () => bloc.dispatch(
                      StartConversionEvent(value: valueController.text)),
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
                    onPressed: () => bloc.dispatch(BackToInputEvent()),
                  ),
                  title: Text("${state.value} ${state.unit}"),
                ),
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
