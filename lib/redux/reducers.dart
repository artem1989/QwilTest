import 'package:qwil_flutter_test/message.dart';

import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';
import 'package:redux/redux.dart';

final Reducer<AppState> appReducer = combineReducers([
  new TypedReducer<AppState, FirstUserMessageSuccessAction>(_onFirstMessageSuccess),
  new TypedReducer<AppState, SecondUserMessageSuccessAction>(_onSecondMessageSuccess),
  new TypedReducer<AppState, ThirdUserMessageSuccessAction>(_onThirdMessageSuccess)
//  new TypedReducer<AppState, UISimulationToggle>(_onSimulationToggle),
//  new TypedReducer<AppState, EmitSummaryItem>(_emitSummaryItem),
//  new TypedReducer<AppState, SummaryMessageSuccessAction>(_onSummaryMessageSuccess)
]);

_onSimulationToggle(AppState state, UISimulationToggle action) {
  return new AppState(state.firstUserLastMessages, state.secondUserLastMessages, state.thirdUserLastMessages, !state.isSimulationActive);
}

AppState _onFirstMessageSuccess(AppState state, FirstUserMessageSuccessAction action) {
  return new AppState(action.message, state.secondUserLastMessages, state.thirdUserLastMessages, !state.isSimulationActive);
}

AppState _onSecondMessageSuccess(AppState state, SecondUserMessageSuccessAction action) {
  return new AppState(state.firstUserLastMessages, action.message, state.thirdUserLastMessages, !state.isSimulationActive);
}

AppState _onThirdMessageSuccess(AppState state, ThirdUserMessageSuccessAction action) {
  return new AppState(state.firstUserLastMessages, state.secondUserLastMessages, action.message, !state.isSimulationActive);
}

//AppState _onSummaryMessageSuccess(AppState state, SummaryMessageSuccessAction action) {
//  state.summaryMessageDuration = action.interval;
//  print(state.summaryMessageDuration);
//  if(state.summaryMessageDuration > 1 && shouldSummaryEmitted(state)) {
//    return new AppState(state.messageItems..add(SummaryItem(action.message)));
//  }
//  return state;
//}
//
//AppState _emitSummaryItem(AppState state, EmitSummaryItem action) {
//  return state;
//}
//
//bool shouldSummaryEmitted(AppState state) {
//  return state.firstUserMessages.isNotEmpty
//      && state.secondUserMessages.isNotEmpty
//      && state.thirdUserMessages.isNotEmpty;
//}
