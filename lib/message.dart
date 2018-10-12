class SummaryItem {
  String text;

  SummaryItem(this.text);

  SummaryItem.fromJson(Map<String, dynamic> json)
      : text = json['text'];

  Map<String, dynamic> toJson() => {'text': text};

  @override
  String toString() {
    return "$text";
  }
}