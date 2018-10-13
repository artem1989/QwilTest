import 'package:flutter/material.dart';
import 'package:qwil_flutter_test/redux/epics.dart';
import 'package:qwil_flutter_test/ui/main_app_component.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:qwil_flutter_test/redux/reducers.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';

typedef onToggle = Function(bool isActive);

void main() {
  final store = new Store<AppState>(appReducer,
      middleware: [ EpicMiddleware<AppState>(epic) ],
      initialState: AppState.initial());
  runApp(new ForeverAloneApp(store));
}
