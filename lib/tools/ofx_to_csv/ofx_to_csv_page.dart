import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../web_download.dart';
import '../widgets/drop_zone.dart';
import '../widgets/tool_top_bar.dart';
import 'csv_builder.dart';
import 'ofx_parser.dart';

const int _kMaxFileSize = 1 * 1024 * 1024;
const int _kMaxTransactions = 10000;

class OfxToCsvPage extends StatefulWidget {
  const OfxToCsvPage({super.key});

  @override
  State<OfxToCsvPage> createState() => _OfxToCsvPageState();
}

class _OfxToCsvPageState extends State<OfxToCsvPage> {
  PickedFile? _file;
  String? _csvOutput;
  String? _error;
  bool _busy = false;
  int _transactionCount = 0;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['ofx'],
      withData: true,
    );
    if (result == null || result.files.isEmpty) return;
    final f = result.files.first;
    if (f.bytes == null) return;
    _acceptFile(PickedFile(
      name: f.name,
      bytes: f.bytes!,
      size: f.size,
    ));
  }

  void _acceptFile(PickedFile f) {
    setState(() {
      _file = f;
      _csvOutput = null;
      _error = null;
      _transactionCount = 0;
    });
  }

  bool _validate() {
    final f = _file;
    if (f == null) {
      setState(() => _error = 'Selecione ou arraste um arquivo .ofx.');
      return false;
    }
    if (!f.name.toLowerCase().endsWith('.ofx')) {
      setState(() => _error = 'Apenas arquivos .ofx são permitidos.');
      return false;
    }
    if (f.size > _kMaxFileSize) {
      setState(() => _error = 'Arquivo muito grande (máx. 1 MB).');
      return false;
    }
    return true;
  }

  Future<void> _convert() async {
    if (!_validate()) return;
    setState(() {
      _busy = true;
      _error = null;
      _csvOutput = null;
    });

    try {
      final content = _decode(_file!.bytes);
      final transactions = OfxParser.parse(content);
      if (transactions.length > _kMaxTransactions) {
        throw const OfxParseException(
          'Arquivo com muitas transações (máx. 10.000).',
        );
      }
      final csv = OfxCsvBuilder.build(transactions);
      setState(() {
        _csvOutput = csv;
        _transactionCount = transactions.length;
      });
    } on OfxParseException catch (e) {
      setState(() => _error = e.message);
    } catch (_) {
      setState(() => _error = 'Erro ao processar arquivo.');
    } finally {
      setState(() => _busy = false);
    }
  }

  String _decode(Uint8List bytes) {
    try {
      return utf8.decode(bytes);
    } catch (_) {
      return latin1.decode(bytes);
    }
  }

  void _download() {
    final csv = _csvOutput;
    if (csv == null) return;
    final base = _file?.name.replaceAll(RegExp(r'\.ofx$', caseSensitive: false), '') ??
        'convertido';
    downloadText(content: csv, filename: '$base.csv');
  }

  void _reset() {
    setState(() {
      _file = null;
      _csvOutput = null;
      _error = null;
      _transactionCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 760;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const ToolTopBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 48 : 20,
                vertical: isWide ? 60 : 32,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'FERRAMENTAS',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'OFX → CSV',
                        style: TextStyle(
                          fontSize: isWide ? 40 : 30,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Converta extratos bancários no formato OFX para CSV. '
                        'O arquivo é processado direto no seu navegador — '
                        'nenhum dado sai do seu computador.',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.textMuted,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 36),
                      Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 520),
                          child: DropZone(
                            label: 'Arraste seu arquivo .ofx aqui',
                            hint: 'ou clique no botão abaixo para selecionar. '
                                'Tamanho máximo: 1 MB.',
                            acceptedExtensions: const ['ofx'],
                            hasFile: _file != null,
                            onPick: _pickFile,
                            onFileDropped: _acceptFile,
                          ),
                        ),
                      ),
                      if (_file != null) ...[
                        const SizedBox(height: 16),
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 520),
                            child: _FileChip(
                              name: _file!.name,
                              size: _file!.size,
                              onClear: _reset,
                            ),
                          ),
                        ),
                      ],
                      if (_error != null) ...[
                        const SizedBox(height: 16),
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 520),
                            child: _ErrorBanner(message: _error!),
                          ),
                        ),
                      ],
                      const SizedBox(height: 28),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 240,
                              child: ElevatedButton.icon(
                                onPressed:
                                    _file == null || _busy ? null : _convert,
                                icon: _busy
                                    ? const SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : const Icon(Icons.bolt_rounded, size: 18),
                                label: Text(
                                    _busy ? 'Convertendo...' : 'Converter'),
                              ),
                            ),
                            if (_csvOutput != null) ...[
                              const SizedBox(height: 14),
                              SizedBox(
                                width: 240,
                                child: ElevatedButton.icon(
                                  onPressed: _download,
                                  icon: const Icon(Icons.download_rounded,
                                      size: 18),
                                  label: const Text('Download CSV'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1F9D55),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (_csvOutput != null) ...[
                        const SizedBox(height: 18),
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 520),
                            child: _SuccessBanner(count: _transactionCount),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FileChip extends StatelessWidget {
  final String name;
  final int size;
  final VoidCallback onClear;

  const _FileChip({
    required this.name,
    required this.size,
    required this.onClear,
  });

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          const Icon(Icons.description_rounded,
              color: AppColors.primary, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  _formatSize(size),
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Remover',
            icon: const Icon(Icons.close_rounded, size: 20),
            color: AppColors.textMuted,
            onPressed: onClear,
          ),
        ],
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  final String message;
  const _ErrorBanner({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEAEA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE57373)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded,
              color: Color(0xFFC1272D), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Color(0xFFC1272D),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuccessBanner extends StatelessWidget {
  final int count;
  const _SuccessBanner({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F6EC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1F9D55).withOpacity(0.4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline_rounded,
              color: Color(0xFF1F9D55), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Conversão concluída: $count transação${count == 1 ? '' : 'ões'} '
              'pront${count == 1 ? 'a' : 'as'} para download.',
              style: const TextStyle(
                color: Color(0xFF196E3D),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
