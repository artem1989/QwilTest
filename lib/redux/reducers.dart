import 'package:qwil_flutter_test/message.dart';
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
      !state.isSimulationActive,
      state.lastSummaryEmitted);
}

AppState _onFirstMessageSuccess(
    AppState state, FirstUserMessageSuccessAction action) {
  print(action.message);

  Summary summary;
  DateTime lastSummaryEmitted;

  if (_isOneSecondLeft(state, action.timeStamp) && _isMessageEmitted(state)) {
    summary = Summary(action.message, action.message,
        state.thirdUserLastMessages);
    lastSummaryEmitted = action.timeStamp;
  } else {
    summary = state.summary;
    lastSummaryEmitted = state.lastSummaryEmitted;
  }

  return new AppState(
      summary,
      action.message,
      state.secondUserLastMessages,
      state.thirdUserLastMessages,
      state.isSimulationActive,
      lastSummaryEmitted);
}

AppState _onSecondMessageSuccess(AppState state, SecondUserMessageSuccessAction action) {

  Summary summary;
  DateTime lastSummaryEmitted;

  if (_isOneSecondLeft(state, action.timeStamp) && _isMessageEmitted(state)) {
    print("11111111");
    summary = Summary(state.firstUserLastMessages, action.message,
        state.thirdUserLastMessages);
    lastSummaryEmitted = action.timeStamp;
  } else {
    print("2222222");
    summary = state.summary;
    lastSummaryEmitted = state.lastSummaryEmitted;
  }

  return new AppState(
      summary,
      state.firstUserLastMessages,
      action.message,
      state.thirdUserLastMessages,
      state.isSimulationActive,
      lastSummaryEmitted);
}

AppState _onThirdMessageSuccess(
    AppState state, ThirdUserMessageSuccessAction action) {
  print(action.message);

  Summary summary;
  DateTime lastSummaryEmitted;

  if (_isOneSecondLeft(state, action.timeStamp) && _isMessageEmitted(state)) {
    summary = Summary(state.firstUserLastMessages, state.secondUserLastMessages,
        state.thirdUserLastMessages);
    lastSummaryEmitted = action.timeStamp;
  } else {
    summary = state.summary;
    lastSummaryEmitted = state.lastSummaryEmitted;
  }

  return new AppState(
      summary,
      state.firstUserLastMessages,
      state.secondUserLastMessages,
      action.message,
      state.isSimulationActive,
      lastSummaryEmitted);
}

bool _isOneSecondLeft(AppState state, DateTime dateTime) {
  print(dateTime.difference(state.lastSummaryEmitted));
  return dateTime.difference(state.lastSummaryEmitted).inSeconds > 1;
}

bool _isMessageEmitted(AppState state) {
  return state.firstUserLastMessages.isNotEmpty &&
      state.secondUserLastMessages.isNotEmpty &&
      state.thirdUserLastMessages.isNotEmpty;
}

//AppState _onSummaryMessageSuccess(
//    AppState state, SummaryMessageSuccessAction action) {
//  bool emitSummary = state.firstUserLastMessages.isNotEmpty &&
//      state.secondUserLastMessages.isNotEmpty &&
//      state.thirdUserLastMessages.isNotEmpty &&
//      (DateTime.now().millisecond - state.lastSummaryEmitted.millisecond >
//          1000);
//
//  print(state.firstUserLastMessages.isNotEmpty);
//  print(state.secondUserLastMessages.isNotEmpty);
//  print(state.thirdUserLastMessages.isNotEmpty);
//  print(DateTime.now().millisecond);
//  print(state.lastSummaryEmitted.millisecond);
//
//  return new AppState(
//      emitSummary
//          ? [
//              state.firstUserLastMessages,
//              state.secondUserLastMessages,
//              state.thirdUserLastMessages
//            ]
//          : [],
//      state.firstUserLastMessages,
//      state.secondUserLastMessages,
//      state.thirdUserLastMessages,
//      state.isSimulationActive,
//      DateTime.now(),
//      emitSummary);
//}
