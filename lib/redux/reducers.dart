import 'package:qwil_flutter_test/message.dart';

import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is AddItemAction) {
    return _addItem(state.messageItems, action);
  } else if (action is UISimulationToggle) {
    return _onSimulationToggle(state, action);
  }
  return state;
}


AppState _onSimulationToggle(AppState state, UISimulationToggle action) {
  return AppState(state.messageItems);
}

AppState _addItem(List<MessageItem> items, AddItemAction action) {
  return new AppState(List.from(items)..add(action.item));
}
