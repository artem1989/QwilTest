import 'package:qwil_flutter_test/message.dart';

import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is AddItemAction) {
    return _addItem(state.messageItems, action);
  } else if (action is UISimulationToggle) {
    return _onSimulationToggle(state, action);
  } else if (action is EmitMessageAction) {
    return _startSimulation(state.messageItems, action);
  } else if (action is MessageSuccessAction) {
    return _onMessageSuccess(state, action);
  }
  return state;
}

AppState _onSimulationToggle(AppState state, UISimulationToggle action) {
  return AppState(state.messageItems);
}

AppState _addItem(List<MessageItem> items, AddItemAction action) {
  return new AppState(List.from(items)..add(action.item));
}

AppState _startSimulation(List<MessageItem> items, EmitMessageAction action) {
  return new AppState(items);
}

AppState _onMessageSuccess(AppState state, MessageSuccessAction action) {
  return new AppState(List.from(state.messageItems)..add(MessageItem(action.message)));
}
