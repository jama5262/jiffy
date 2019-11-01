bool matchStringDateTime(String input) {
  return RegExp(r"\d{4}-\d{1,2}-\d{1,2}$").hasMatch(input);
}

Pattern matchOrdinalDays(String input) {
  return RegExp(r"(?<=[0-9])(?:st|nd|rd|th)");
}