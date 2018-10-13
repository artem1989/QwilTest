import 'package:qwil_flutter_test/model/message_item.dart';

/// Action triggered by start/stop simulation
class UISimulationToggle {
  bool startSimulation;

  UISimulationToggle(this.startSimulation);
}

/// Action triggered when first user message delivered
class FirstUserMessageSuccessAction {
  final MessageItem messageItem;

  FirstUserMessageSuccessAction(this.messageItem);
}

/// Action triggered when second user message delivered
class SecondUserMessageSuccessAction {
  final MessageItem messageItem;

  SecondUserMessageSuccessAction(this.messageItem);
}

/// Action triggered when third user message delivered
class ThirdUserMessageSuccessAction {
  final MessageItem messageItem;

  ThirdUserMessageSuccessAction(this.messageItem);
}
