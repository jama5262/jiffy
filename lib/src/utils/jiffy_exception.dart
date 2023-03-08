class JiffyException implements Exception {
  final String _message;

  JiffyException(this._message);

  @override
  String toString() {
    return 'JiffyException: $_message';
  }
}
