class JiffyException implements Exception {
  final String _cause;
  JiffyException(this._cause);
  String get cause => 'JiffyException: $_cause';
}
