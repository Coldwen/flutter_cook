extension StringEX on String? {
  bool isStrEmpty() {
    if (this == null) return true;
    if (this!.trim() == '') return true;
    return false;
  }

  String defaultStr(String text) {
    if (this!.trim() == '') return text;
    return this!;
  }
}
