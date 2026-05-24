import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 96 : 24,
        vertical: isWide ? 110 : 70,
      ),
      color: AppColors.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _text(isWide)),
                    const SizedBox(width: 64),
                    Expanded(flex: 4, child: _stats()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _text(isWide),
                    const SizedBox(height: 32),
                    _stats(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _text(bool isWide) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SOBRE NÓS',
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Pessoas que entendem de tecnologia.',
          style: TextStyle(
            fontSize: isWide ? 38 : 28,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Somos um time apaixonado por criar soluções digitais que realmente '
          'fazem diferença. Trabalhamos com Flutter e suas bibliotecas para '
          'entregar aplicativos, sistemas e websites multiplataforma com '
          'performance, design moderno e código sustentável.',
          style: TextStyle(
            fontSize: 16,
            height: 1.7,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _stats() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F0D1F6E),
            blurRadius: 30,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatRow(value: 'Flutter', label: 'Stack principal'),
          SizedBox(height: 22),
          _StatRow(value: 'Multi', label: 'iOS · Android · Web · Desktop'),
          SizedBox(height: 22),
          _StatRow(value: '100%', label: 'Foco em qualidade'),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String value;
  final String label;
  const _StatRow({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
