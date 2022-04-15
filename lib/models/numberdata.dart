class NumberData {
  String? text;
  bool? found;
  int? number;
  String? type;
  String? date;
  String? year;
  NumberData(
      {this.date, this.found, this.number, this.text, this.type, this.year});
  NumberData.fromJson(Map<String, dynamic>? json) {
    text = json!['text'];
    found = json['found'];
    number = json['number'];
    type = json['type'];
    date = json['date'];
    year = json['year'];
  }
}
