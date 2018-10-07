import 'package:qwil_flutter_test/message.dart';

class AppState {
  static var empty = AppState(new List());

  final List<MessageItem> messageItems;

  AppState(this.messageItems);

  factory AppState.initial() {
    List<MessageItem> initial = [MessageItem("First message"), MessageItem("Second message")];
    return AppState(initial);
  }

  AppState.fromJson(Map<String, dynamic> json)
      : messageItems = (json['messageItems'] as List)
      .map((i) => new MessageItem.fromJson(i as Map<String, dynamic>))
      .toList();

  Map<String, dynamic> toJson() => {'messageItems': messageItems};

  @override
  String toString() => "$messageItems";
}
