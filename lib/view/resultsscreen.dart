import 'package:cleverconvert/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "${state.value} ${state.unit}",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return (index < state.results.length)
                      ? ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "${state.results.values.elementAt(index)}",
                              ),
                              Text(
                                "${state.results.keys.elementAt(index)}",
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(
                                  text: state.results.values.elementAt(index),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Value copied to clipboard",
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.content_copy),
                          ),
                        )
                      : null;
                }),
              )
            ],
          ),
        );
      },
    );
  }
}
