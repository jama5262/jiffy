List<String> _localeOrdinals = [
  'en',
  'es',
  'fr',
  'frch',
  'frca',
  'it',
  'itch',
  'ja',
  'ko',
  'pt',
  'ptbr',
  'zh',
  'zhcn',
  'zhhk',
  'zhtw',
  'de',
  'deat',
  'dech',
  'tr'
];

List<String>? getOrdinalLocaleDates(String locale) {
  var ordinals = {
    _localeOrdinals[0]: ['th', 'st', 'nd', 'rd'],
    _localeOrdinals[1]: ['º', 'º', 'º', 'º'],
    _localeOrdinals[2]: ['', 'er', '', ''],
    _localeOrdinals[3]: ['e', 'er', 'e', 'e'],
    _localeOrdinals[4]: ['e', 'er', 'e', 'e'],
    _localeOrdinals[5]: ['º', 'º', 'º', 'º'],
    _localeOrdinals[6]: ['º', 'º', 'º', 'º'],
    _localeOrdinals[7]: ['日', '日', '日', '日'],
    _localeOrdinals[8]: ['일', '일', '일', '일'],
    _localeOrdinals[9]: ['º', 'º', 'º', 'º'],
    _localeOrdinals[10]: ['º', 'º', 'º', 'º'],
    _localeOrdinals[11]: ['日', '日', '日', '日'],
    _localeOrdinals[12]: ['日', '日', '日', '日'],
    _localeOrdinals[13]: ['日', '日', '日', '日'],
    _localeOrdinals[14]: ['日', '日', '日', '日'],
    _localeOrdinals[15]: ['.', '.', '.', '.'],
    _localeOrdinals[16]: ['.', '.', '.', '.'],
    _localeOrdinals[17]: ['.', '.', '.', '.'],
    _localeOrdinals[18]: ['.', '.', '.', '.']
  };
  return ordinals[locale];
}
