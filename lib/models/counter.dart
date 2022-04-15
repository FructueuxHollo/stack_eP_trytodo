class Counter {
  Counter({this.count = 0, this.data, this.tabindex = 0});
  int count;
  int tabindex;
  String? data;
  int first(int count) {
    if (count % 2 == 0) {
      return 1;
    } else if (count % 3 == 0) {
      return 2;
    } else if (count % 5 == 0) {
      return 3;
    } else if (count % 7 == 0) {
      return 4;
    } else {
      return 0;
    }
  }
}
