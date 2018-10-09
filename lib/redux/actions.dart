import 'package:qwil_flutter_test/message.dart';

typedef OnFinishAPI = void Function(String message);

class UISimulationToggle {

}

class AddItemAction {
  final MessageItem item;

  AddItemAction(this.item);
}

class EmitMessageAction {

  EmitMessageAction();
}

class MessageSuccessAction {
  final String message;

  MessageSuccessAction(this.message);
}
