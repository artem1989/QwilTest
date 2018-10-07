class MessageItem {
  String text;

  MessageItem(this.text);

  MessageItem.fromJson(Map<String, dynamic> json)
      : text = json['text'];

  Map<String, dynamic> toJson() => {'text': text};

  @override
  String toString() {
    return "$text";
  }
}