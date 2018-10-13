import 'package:qwil_flutter_test/model/Summary.dart';

import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';
import 'package:redux/redux.dart';

final Reducer<AppState> appReducer = combineReducers([
  new TypedReducer<AppState, FirstUserMessageSuccessAction>(
      _onFirstMessageSuccess),
  new TypedReducer<AppState, SecondUserMessageSuccessAction>(
      _onSecondMessageSuccess),
  new TypedReducer<AppState, ThirdUserMessageSuccessAction>(
      _onThirdMessageSuccess),
  new TypedReducer<AppState, UISimulationToggle>(_onSimulationToggle)
]);

AppState _onSimulationToggle(AppState state, UISimulationToggle action) {
  return new AppState(
      state.summary,
      state.firstUserLastMessages,
      state.secondUserLastMessages,
      state.thirdUserLastMessages,
      !state.isSimulationActive);
}

AppState _onFirstMessageSuccess(
    AppState state, FirstUserMessageSuccessAction action) {

  return new AppState(
      _buildSummary(state, action.timeStamp),
      action.message,
      state.secondUserLastMessages,
      state.thirdUserLastMessages,
      state.isSimulationActive);
}

AppState _onSecondMessageSuccess(AppState state, SecondUserMessageSuccessAction action) {
  return new AppState(
      _buildSummary(state, action.timeStamp),
      state.firstUserLastMessages,
      action.message,
      state.thirdUserLastMessages,
      state.isSimulationActive);
}

AppState _onThirdMessageSuccess(AppState state, ThirdUserMessageSuccessAction action) {
  return new AppState(
      _buildSummary(state, action.timeStamp),
      state.firstUserLastMessages,
      state.secondUserLastMessages,
      action.message,
      state.isSimulationActive);
}

/// Indicates whether or not one second left after last summary emitting
/// [currentSummary] current summary object with timestamp emitted
/// [dateTime] new message timestamp
bool _isOneSecondLeft(Summary currentSummary, DateTime dateTime) {
  return dateTime.difference(currentSummary.timeStamp).inSeconds > 1;
}

/// Indicated whether or not all messages have been emitted at least once
/// [state] current app state
bool _isMessageEmitted(AppState state) {
  return state.firstUserLastMessages.isNotEmpty &&
      state.secondUserLastMessages.isNotEmpty &&
      state.thirdUserLastMessages.isNotEmpty;
}

/// Build new summary item to display if conditions fit, current summary otherwise
/// [state] current app state
/// [timeStamp] of emitted user message
Summary _buildSummary(AppState state, DateTime timeStamp) {
  if (_isOneSecondLeft(state.summary, timeStamp) && _isMessageEmitted(state)) {
    return Summary(state.firstUserLastMessages, state.secondUserLastMessages,
        state.thirdUserLastMessages, timeStamp);
  }
  return state.summary;
}
