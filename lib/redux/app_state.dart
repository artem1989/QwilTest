import 'package:qwil_flutter_test/model/Summary.dart';

class AppState {

  final Summary summary;

  final String firstUserLastMessages;
  final String secondUserLastMessages;
  final String thirdUserLastMessages;

  bool isSimulationActive;

  AppState(this.summary, this.firstUserLastMessages, this.secondUserLastMessages,
      this.thirdUserLastMessages, this.isSimulationActive);

  factory AppState.initial() {
    // Initial summary contains empty strings and timeStamp of start application
    Summary initialSummary = Summary("", "", "", DateTime.now());
    return AppState(initialSummary, "", "", "", false);
  }

}
