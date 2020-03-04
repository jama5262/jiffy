bool matchDartStringDateTime(String input) {
  return RegExp(
          r'\d{4}-\d{1,2}-\d{1,2} \d{1,2}(:\d{1,2})?(:\d{1,2})?(.\d+)?(Z?)')
      .hasMatch(input);
}

bool matchISOStringDateTime(String input) {
  return RegExp(
          r'\d{4}-\d{1,2}-\d{1,2}T\d{1,2}(:\d{1,2})?(:\d{1,2})?(.\d+)?(Z?)')
      .hasMatch(input);
}

RegExp matchBasicStringDateTime() {
  return RegExp(r'(\d{4})(\d{1,2})(\d{1,2})$');
}

bool matchHyphenStringDateTime(String input) {
  return RegExp(r'\d{4}-\d{1,2}-\d{1,2}$').hasMatch(input);
}

bool matchSlashStringDateTime(String input) {
  return RegExp(r'\d{4}\/\d{1,2}\/\d{1,2}$').hasMatch(input);
}

Pattern matchOrdinalDates() {
  return RegExp(r'(?<=[0-9])(?:st|nd|rd|th)');
}

Pattern matchOrdinalDatePattern() {
  return RegExp(
      '''(?<unquote>[^"'\\s]\\w*)|(?:["][^"]+?["])|(?:['][^']+?['])''');
}
