import 'package:qwil_flutter_test/message.dart';

class AddItemAction {
  final SummaryItem item;

  AddItemAction(this.item);
}

class UISimulationToggle{}

class FirstUserMessageSuccessAction {
  final String message;

  FirstUserMessageSuccessAction(this.message);
}

class SecondUserMessageSuccessAction {
  final String message;

  SecondUserMessageSuccessAction(this.message);
}

class ThirdUserMessageSuccessAction {
  final String message;

  ThirdUserMessageSuccessAction(this.message);
}

class SummaryMessageSuccessAction {
  final String message;
  final int interval;

  SummaryMessageSuccessAction(this.message, this.interval);
}

class EmitSummaryItem {

}
