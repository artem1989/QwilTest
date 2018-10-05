import 'package:redux/redux.dart';

import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';

final appStateReducer = combineReducers<AppState>([
  TypedReducer<AppState, UISimulationToggle>(_onSimulationToggle),
]);

AppState _onSimulationToggle(AppState state, UISimulationToggle action) {
  return AppState();
}
