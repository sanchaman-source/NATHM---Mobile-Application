const String _host = 'https://nathm-backend.onrender.com';

String? resolveTrainingImage(String? raw) {
  if (raw == null || raw.trim().isEmpty) return null;
  final url = raw.trim();

  final localhost = RegExp(r'^https?://(localhost|127\.0\.0\.1)(:\d+)?');
  if (localhost.hasMatch(url)) {
    return url.replaceFirst(localhost, _host);
  }
  if (url.startsWith('/')) return '$_host$url';
  if (!url.startsWith('http')) return '$_host/$url';
  return url;
}

String formatTrainingFee(num fee) {
  if (fee <= 0) return 'Free';
  final text = fee % 1 == 0 ? fee.toInt().toString() : fee.toStringAsFixed(2);
  return 'NPR $text';
}