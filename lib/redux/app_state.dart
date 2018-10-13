import 'package:qwil_flutter_test/model/Summary.dart';

class AppState {

  final Summary summary;

  final String firstUserLastMessages;
  final String secondUserLastMessages;
  final String thirdUserLastMessages;

  DateTime lastSummaryEmitted;
  bool isSimulationActive;
  bool shouldSummaryEmitted;

  AppState(this.summary, this.firstUserLastMessages, this.secondUserLastMessages,
      this.thirdUserLastMessages, this.isSimulationActive, this.lastSummaryEmitted);

  factory AppState.initial() {
    return AppState(Summary("", "", ""), "", "", "", false, DateTime.now());
  }

}
