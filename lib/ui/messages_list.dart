import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qwil_flutter_test/ui/message_row_item.dart';
import 'package:qwil_flutter_test/redux/app_state.dart';

class MessagesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<String>>(
      converter: (store) => [
            store.state.summary.firstMessage,
            store.state.summary.secondMessage,
            store.state.summary.thirdMessage
          ],
      builder: (context, list) {
        return new ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, position) =>
                new MessageRow("User ${position + 1}:", list[position]));
      },
    );
  }
}
