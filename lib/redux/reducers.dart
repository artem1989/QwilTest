import 'package:qwil_flutter_test/model/message_item.dart';
import 'package:qwil_flutter_test/model/summary_item.dart';

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
      state.firstUserLastMessage,
      state.secondUserLastMessage,
      state.thirdUserLastMessage,
      !state.isSimulationActive);
}

AppState _onFirstMessageSuccess(
    AppState state, FirstUserMessageSuccessAction action) {
  return new AppState(
      _buildSummary(state, action.messageItem.timeStamp),
      action.messageItem,
      state.secondUserLastMessage,
      state.thirdUserLastMessage,
      state.isSimulationActive);
}

AppState _onSecondMessageSuccess(
    AppState state, SecondUserMessageSuccessAction action) {
  return new AppState(
      _buildSummary(state, action.messageItem.timeStamp),
      state.firstUserLastMessage,
      action.messageItem,
      state.thirdUserLastMessage,
      state.isSimulationActive);
}

AppState _onThirdMessageSuccess(
    AppState state, ThirdUserMessageSuccessAction action) {
  return new AppState(
      _buildSummary(state, action.messageItem.timeStamp),
      state.firstUserLastMessage,
      state.secondUserLastMessage,
      action.messageItem,
      state.isSimulationActive);
}

/// Indicates whether or not one second left after last summary emitting
/// [currentSummary] current summary object with timestamp emitted
/// [dateTime] new message timestamp
bool _isOneSecondLeft(SummaryItem currentSummary, DateTime dateTime) {
  return dateTime.difference(currentSummary.timeStamp).inSeconds > 1;
}

/// Indicated whether or not all messages have been emitted at least once
/// [state] current app state
bool _isMessageEmitted(AppState state) {
  return state.firstUserLastMessage.message.isNotEmpty &&
      state.secondUserLastMessage.message.isNotEmpty &&
      state.thirdUserLastMessage.message.isNotEmpty;
}

/// Build new summary item to display if conditions fit, current summary otherwise
/// [state] current app state
/// [timeStamp] of emitted user message
SummaryItem _buildSummary(AppState state, DateTime timeStamp) {
  var firstMessage =
      _updateNoneDeliveredMessage(state.firstUserLastMessage, timeStamp);
  var secondMessage =
      _updateNoneDeliveredMessage(state.secondUserLastMessage, timeStamp);
  var thirdMessage =
      _updateNoneDeliveredMessage(state.thirdUserLastMessage, timeStamp);
  if (_isOneSecondLeft(state.summary, timeStamp) && _isMessageEmitted(state)) {
    return SummaryItem(firstMessage, secondMessage, thirdMessage, timeStamp);
  }
  return state.summary;
}

String _updateNoneDeliveredMessage(
    MessageItem messageItem, DateTime timeStamp) {
  if (timeStamp.difference(messageItem.timeStamp).inSeconds > 10) {
    return "N/A";
  }
  return messageItem.message;
}
