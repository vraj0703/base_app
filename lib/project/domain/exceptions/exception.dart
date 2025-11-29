class LoadingJsonException implements Exception {
  String message;

  LoadingJsonException(this.message);

  @override
  String toString() => 'LoadingJsonException: $message';
}
