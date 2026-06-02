class OfxTransaction {
  final DateTime date;
  final double amount;
  final String payee;

  const OfxTransaction({
    required this.date,
    required this.amount,
    required this.payee,
  });
}

class OfxParseException implements Exception {
  final String message;
  const OfxParseException(this.message);
  @override
  String toString() => 'OfxParseException: $message';
}

/// Minimal OFX parser that supports both SGML (1.x) and XML (2.x) OFX files.
/// Extracts STMTTRN blocks and returns the fields used by the OFX → CSV
/// converter: DTPOSTED, TRNAMT, NAME/MEMO.
class OfxParser {
  static List<OfxTransaction> parse(String content) {
    final normalized = _stripOfxHeader(content);

    final stmtRegex = RegExp(
      r'<STMTTRN>(.*?)</STMTTRN>',
      caseSensitive: false,
      dotAll: true,
    );

    final matches = stmtRegex.allMatches(normalized).toList();
    if (matches.isEmpty) {
      throw const OfxParseException(
        'Nenhuma transação encontrada no arquivo OFX.',
      );
    }

    final result = <OfxTransaction>[];
    for (final m in matches) {
      final block = m.group(1)!;
      final rawDate = _field(block, 'DTPOSTED');
      final rawAmt = _field(block, 'TRNAMT');
      final payee = _field(block, 'NAME') ?? _field(block, 'MEMO') ?? '';

      if (rawDate == null || rawAmt == null) continue;

      final date = _parseOfxDate(rawDate);
      final amount = double.tryParse(rawAmt.replaceAll(',', '.'));
      if (date == null || amount == null) continue;

      result.add(OfxTransaction(
        date: date,
        amount: amount,
        payee: _cleanText(payee),
      ));
    }

    if (result.isEmpty) {
      throw const OfxParseException(
        'Não foi possível ler nenhuma transação válida.',
      );
    }
    return result;
  }

  static String _stripOfxHeader(String content) {
    final idx = content.indexOf('<OFX>');
    if (idx < 0) {
      final lower = content.toLowerCase().indexOf('<ofx>');
      if (lower < 0) return content;
      return content.substring(lower);
    }
    return content.substring(idx);
  }

  static String? _field(String block, String tag) {
    final regex = RegExp(
      '<$tag>([^<\\r\\n]*)',
      caseSensitive: false,
    );
    final m = regex.firstMatch(block);
    if (m == null) return null;
    return m.group(1)?.trim();
  }

  static DateTime? _parseOfxDate(String raw) {
    final cleaned = raw.trim().replaceAll(RegExp(r'[^0-9]'), '');
    if (cleaned.length < 8) return null;
    final y = int.tryParse(cleaned.substring(0, 4));
    final m = int.tryParse(cleaned.substring(4, 6));
    final d = int.tryParse(cleaned.substring(6, 8));
    if (y == null || m == null || d == null) return null;
    try {
      return DateTime(y, m, d);
    } catch (_) {
      return null;
    }
  }

  static String _cleanText(String s) {
    return s
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .trim();
  }
}
