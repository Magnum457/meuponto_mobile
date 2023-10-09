class Failure implements Exception {
  final String? message;

  const Failure({
    this.message,
  });

  String get getMessage => message ?? 'Erro desconhecido';
}
