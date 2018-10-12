import 'package:qwil_flutter_test/message.dart';

class AppState {

  final String firstUserLastMessages;
  final String secondUserLastMessages;
  final String thirdUserLastMessages;

  int summaryMessageDuration;
  bool isSimulationActive;

  AppState(this.firstUserLastMessages, this.secondUserLastMessages, this.thirdUserLastMessages, this.isSimulationActive);

  factory AppState.initial() {
    return AppState("", "", "", false);
  }

}
