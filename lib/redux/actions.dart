/// Action triggered by start/stop simulation
class UISimulationToggle {
  bool startSimulation;

  UISimulationToggle(this.startSimulation);
}

/// Action triggered when first user message delivered
class FirstUserMessageSuccessAction {
  final String message;
  final DateTime timeStamp;

  FirstUserMessageSuccessAction(this.message, this.timeStamp);
}

/// Action triggered when second user message delivered
class SecondUserMessageSuccessAction {
  final String message;
  final DateTime timeStamp;

  SecondUserMessageSuccessAction(this.message, this.timeStamp);
}

/// Action triggered when third user message delivered
class ThirdUserMessageSuccessAction {
  final String message;
  final DateTime timeStamp;

  ThirdUserMessageSuccessAction(this.message, this.timeStamp);
}
