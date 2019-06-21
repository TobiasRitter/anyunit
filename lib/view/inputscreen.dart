import 'package:anyunit/bloc/bloc.dart';
import 'package:anyunit/view/resultsscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
