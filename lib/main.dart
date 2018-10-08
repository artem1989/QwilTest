import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qwil_flutter_test/message.dart';
import 'package:qwil_flutter_test/message_row_item.dart';
import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:redux/redux.dart';

import 'package:qwil_flutter_test/redux/reducers.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';

void main() {
  final store = new Store<AppState>(
      appStateReducers,
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
                  return () => store.dispatch(AddItemAction(MessageItem("1111111111")));
                },
                builder: (context, callback) {
                  return new IconButton(
                    icon: new Icon(Icons.add),
                    onPressed: () {
                      callback();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }





//  Widget _toggleButton() {
//    return new RaisedButton(
//      onPressed: _toggleSimulation,
//      textColor: Colors.white,
//      color: Colors.blue,
//      child: new Text(
//        'Stop',
//        style: new TextStyle(
//          fontWeight: FontWeight.bold,
//          fontSize: 20.0,
//        ),
//      ),
//    );
//  }
}

class MessagesList extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<MessageItem>>(
      converter: (store) => store.state.messageItems,
      builder: (context, list) {
        return new ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, position) =>
            new MessageRow("user", list[position].text));
      },
    );
  }
}
