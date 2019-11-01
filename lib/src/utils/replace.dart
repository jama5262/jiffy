String replaceToLocaleNum(String input, locale) {
  Map<String, List<String>> localNumbers = {
    "en": ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
    "ar": ['۰', '۱', '۲', '۳', '٤', '۵', '٦', '۷', '۸', '۹'],
    "hi": ['०', '१', '२', '३', '४', '५', '६', '७', '८', '९']
  };
  for (int i = 0; i < localNumbers["en"].length; i++) {
    input = input.replaceAll(localNumbers["en"][i], localNumbers[locale][i]);
  }
  return input;
}

String replaceParseInput(String input) {
  return input.replaceFirst(' pm', ' PM').replaceFirst(' am', ' AM');
}

String replaceOrdinalDayPattern(String input) {
  return input.replaceFirst('do', 'd');
}
