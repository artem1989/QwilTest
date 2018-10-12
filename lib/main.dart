import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qwil_flutter_test/message_row_item.dart';
import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/epics.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:qwil_flutter_test/redux/reducers.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';

void main() {
  final store = new Store<AppState>(
      appReducer,
      middleware: [ EpicMiddleware<AppState>(epic) ],
      initialState: AppState.initial());
  runApp(new ForeverAloneApp(store));
}

class ForeverAloneApp extends StatelessWidget {
  final Store<AppState> store;

  ForeverAloneApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: this.store,
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
              MessagesList(),
              new StoreConnector<AppState, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(UISimulationToggle());
                },
                builder: (context, callback) {
                  return new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[ new RaisedButton(
                    onPressed: callback,
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: new Text(
                      'Stop',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  )]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<String>>(
      converter: (store) => [store.state.firstUserLastMessages, store.state.secondUserLastMessages, store.state.thirdUserLastMessages],
      builder: (context, list) {
        return new ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, position) =>
            new MessageRow("user " + position.toString(), list[position]));
      },
    );
  }
}
