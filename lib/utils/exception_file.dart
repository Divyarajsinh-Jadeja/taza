class ErpException implements Exception {
  final String message;
  final String code;

  ErpException({required this.message, required this.code});

  @override
  String toString() {
    return 'ERPException{message: $message, code: $code}';
  }
}
