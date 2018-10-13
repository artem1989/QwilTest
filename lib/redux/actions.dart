import 'package:qwil_flutter_test/message.dart';

class AddItemAction {
  final SummaryItem item;

  AddItemAction(this.item);
}

class UISimulationToggle {
  bool startSimulation;

  UISimulationToggle(this.startSimulation);
}

class FirstUserMessageSuccessAction {
  final String message;
  final DateTime timeStamp;

  FirstUserMessageSuccessAction(this.message, this.timeStamp);
}

class SecondUserMessageSuccessAction {
  final String message;
  final DateTime timeStamp;

  SecondUserMessageSuccessAction(this.message, this.timeStamp);
}

class ThirdUserMessageSuccessAction {
  final String message;
  final DateTime timeStamp;

  ThirdUserMessageSuccessAction(this.message, this.timeStamp);
}

class SummaryMessageSuccessAction {}

class EmitSummaryItem {}
