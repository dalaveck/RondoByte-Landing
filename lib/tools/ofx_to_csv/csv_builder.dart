import 'ofx_parser.dart';

class OfxCsvBuilder {
  static String build(List<OfxTransaction> transactions) {
    final buf = StringBuffer();
    buf.writeln('Data;Descrição;Valor');
    for (final t in transactions) {
      final date = _formatDate(t.date);
      final payee = _truncate(t.payee, 200);
      final value = '${t.amount.toStringAsFixed(2).replaceAll('.', ',')};';
      buf.writeln('${_csv(date)};${_csv(payee)};${_csv(value)}');
    }
    return buf.toString();
  }

  static String _formatDate(DateTime d) {
    final dd = d.day.toString().padLeft(2, '0');
    final mm = d.month.toString().padLeft(2, '0');
    return '$dd/$mm/${d.year}';
  }

  static String _truncate(String s, int max) =>
      s.length <= max ? s : s.substring(0, max);

  static String _csv(String s) {
    if (s.contains(';') || s.contains('"') || s.contains('\n')) {
      return '"${s.replaceAll('"', '""')}"';
    }
    return s;
  }
}
