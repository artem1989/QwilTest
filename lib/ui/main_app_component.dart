import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';
import 'package:qwil_flutter_test/ui/messages_list.dart';
import 'package:redux/redux.dart';

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
              new StoreConnector<AppState, _ViewModel>(
                converter: (store) {
                  return _ViewModel.create(store);
                },
                builder: (context, vm) {
                  return new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Align(
                            alignment: Alignment.center,
                            child: new RaisedButton(
                              onPressed: vm.onToggle,
                              textColor: Colors.white,
                              color: Colors.blue,
                              child: new Text(
                                vm.isActive ? 'Stop' : 'Start',
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ))
                      ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ViewModel {
  final bool isActive;
  final Function onToggle;

  _ViewModel(this.isActive, this.onToggle);

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        store.state.isSimulationActive,
        () => store
            .dispatch(UISimulationToggle(!store.state.isSimulationActive)));
  }
}
