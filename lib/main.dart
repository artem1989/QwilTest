import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:qwil_flutter_test/redux/reducers.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: new Store<AppState>(
          appStateReducer,
          initialState: AppState.initial(),
        ),
        child: new MaterialApp(
          title: 'Forever Alone',
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: new MyHomePage(title: 'Forever Alone'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Container(
          child: new Stack(
            children: <Widget>[
              _mainDashboard(),
              _toggleButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainDashboard() {
    return new Column(
      children: <Widget>[
        _messageRow('FAKE FIRST USER',
            "There are many variations of passages of Lorem Ipsum available,"),
        _messageRow('SECOND USER',
            "It is a long established fact that a reader will be distracted by the"),
        _messageRow('ANOTHER USER',
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
      ],
    );
  }

  Widget _messageRow(String user, String message) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                child: new Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    user,
                  ),
                ),
              ),
              Text(
                message,
              ),
            ],
          ),
        ),
        Icon(
          Icons.access_time,
        ),
      ],
    );
  }

  Widget _toggleButton() {
    return new RaisedButton(
      onPressed: _toggleSimulation,
      textColor: Colors.white,
      color: Colors.blue,
      child: new Text(
        'Stop',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }

  void _toggleSimulation() {}
}
