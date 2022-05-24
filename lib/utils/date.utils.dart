String? formatDateTime(DateTime? date) {
  return date?.toIso8601String().replaceAll('T', ' ').substring(0, 16);
}
