import 'package:flutter_test/flutter_test.dart';
import 'package:qwil_flutter_test/model/message_item.dart';
import 'package:qwil_flutter_test/model/summary_item.dart';
import 'package:qwil_flutter_test/redux/actions.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';
import 'package:qwil_flutter_test/redux/reducers.dart';
import 'package:redux/redux.dart';

void main() {
  test(
      'should update first user last message in response to an FirstUserMessageSuccessAction',
      () {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
    );
    final messageItem = MessageItem("test message", DateTime.now());

    store.dispatch(FirstUserMessageSuccessAction(messageItem));

    expect(store.state.firstUserLastMessage.message, "test message");
  });

  test(
      'should update first user last message in response to an FirstUserMessageSuccessAction',
          () {
        final store = Store<AppState>(
          appReducer,
          initialState: AppState.initial(),
        );
        final messageItem = MessageItem("test message", DateTime.now());

        store.dispatch(FirstUserMessageSuccessAction(messageItem));

        expect(store.state.firstUserLastMessage.message, "test message");
      });

  test(
      'should not update summary message if not all users sends at least one message',
          () {
        final store = Store<AppState>(
          appReducer,
          initialState: new AppState(new SummaryItem("", "", "", DateTime.now()),
              new MessageItem("", DateTime.now()),
              new MessageItem("test string 2", DateTime.now()),
              new MessageItem("test string 3", DateTime.now()),
              true),
        );

        // Message delivered after 2 seconds left after last summary emitting
        final messageItem = MessageItem("test message", DateTime.now().add(Duration(seconds: 2)));

        store.dispatch(FirstUserMessageSuccessAction(messageItem));

        // Expected initial empty string in summary first user message
        expect(store.state.summary.firstMessage, "");
      });
}
