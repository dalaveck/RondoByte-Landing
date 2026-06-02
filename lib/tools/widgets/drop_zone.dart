import 'dart:async';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PickedFile {
  final String name;
  final Uint8List bytes;
  final int size;
  const PickedFile({required this.name, required this.bytes, required this.size});
}

class DropZone extends StatefulWidget {
  final VoidCallback onPick;
  final ValueChanged<PickedFile> onFileDropped;
  final String label;
  final String hint;
  final List<String> acceptedExtensions;
  final bool hasFile;

  const DropZone({
    super.key,
    required this.onPick,
    required this.onFileDropped,
    required this.label,
    required this.hint,
    required this.acceptedExtensions,
    this.hasFile = false,
  });

  @override
  State<DropZone> createState() => _DropZoneState();
}

class _DropZoneState extends State<DropZone> {
  bool _dragging = false;
  StreamSubscription<html.MouseEvent>? _overSub;
  StreamSubscription<html.MouseEvent>? _leaveSub;
  StreamSubscription<html.MouseEvent>? _dropSub;

  @override
  void initState() {
    super.initState();
    _overSub = html.document.body!.onDragOver.listen((event) {
      event.preventDefault();
      if (!_dragging) setState(() => _dragging = true);
    });
    _leaveSub = html.document.body!.onDragLeave.listen((event) {
      if (event.client.x <= 0 || event.client.y <= 0) {
        if (_dragging) setState(() => _dragging = false);
      }
    });
    _dropSub = html.document.body!.onDrop.listen((event) {
      event.preventDefault();
      setState(() => _dragging = false);
      final files = event.dataTransfer.files;
      if (files == null || files.isEmpty) return;
      _handleHtmlFile(files.first);
    });
  }

  void _handleHtmlFile(html.File file) {
    final reader = html.FileReader();
    reader.onLoadEnd.listen((_) {
      final result = reader.result;
      if (result is Uint8List) {
        widget.onFileDropped(PickedFile(
          name: file.name,
          bytes: result,
          size: file.size,
        ));
      } else if (result is ByteBuffer) {
        widget.onFileDropped(PickedFile(
          name: file.name,
          bytes: result.asUint8List(),
          size: file.size,
        ));
      }
    });
    reader.readAsArrayBuffer(file);
  }

  @override
  void dispose() {
    _overSub?.cancel();
    _leaveSub?.cancel();
    _dropSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor;
    final Color background;
    final double borderWidth;
    if (_dragging) {
      borderColor = AppColors.accent;
      background = AppColors.accent.withOpacity(0.06);
      borderWidth = 2.5;
    } else if (widget.hasFile) {
      borderColor = AppColors.primary.withOpacity(0.35);
      background = const Color(0xFFE2E7F7);
      borderWidth = 1.5;
    } else {
      borderColor = const Color(0xFFB7C2E8);
      background = AppColors.backgroundAlt;
      borderWidth = 1.5;
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 44),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.cloud_upload_rounded,
              size: 32,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            widget.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.hint,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13.5,
              color: AppColors.textMuted,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: widget.onPick,
            icon: const Icon(Icons.folder_open_rounded, size: 18),
            label: const Text('Selecionar arquivo'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary, width: 1.5),
              padding:
                  const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
