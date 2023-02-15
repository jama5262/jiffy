String replaceToLocaleNum(String input, String locale) {
  var localeNumbers = {
    'en': ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
    'ar': ['۰', '۱', '۲', '۳', '٤', '۵', '٦', '۷', '۸', '۹'],
    'fa': ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'],
    'bn': ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯']
  };
  for (var i = 0; i < localeNumbers['en']!.length; i++) {
    input =
        input.replaceAll(localeNumbers['en']![i], localeNumbers[locale]![i]);
  }
  return input;
}
