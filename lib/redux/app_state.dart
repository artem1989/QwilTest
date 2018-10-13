import 'package:qwil_flutter_test/model/message_item.dart';
import 'package:qwil_flutter_test/model/summary_item.dart';

class AppState {
  final SummaryItem summary;

  final MessageItem firstUserLastMessage;
  final MessageItem secondUserLastMessage;
  final MessageItem thirdUserLastMessage;

  bool isSimulationActive;

  AppState(this.summary, this.firstUserLastMessage, this.secondUserLastMessage,
      this.thirdUserLastMessage, this.isSimulationActive);

  factory AppState.initial() {
    // Initial summary contains empty strings and timeStamp of start application
    var initialSummary = SummaryItem("", "", "", DateTime.now());
    var initialMessageItem = MessageItem("", DateTime.now());
    return AppState(initialSummary, initialMessageItem, initialMessageItem,
        initialMessageItem, false);
  }
}
