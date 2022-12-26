class JiffyException implements Exception {
  final String _message;

  JiffyException(this._message);

  // todo remove this getter, will start using the toString
  String get message => 'JiffyException: $_message';

  @override
  String toString() {
    return 'JiffyException: $_message';
  }
}
