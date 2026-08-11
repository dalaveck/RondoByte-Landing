import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../tools/widgets/tool_top_bar.dart';

/// Bloco de conteúdo para páginas de política / termos.
class PoliticaSection {
  const PoliticaSection({
    required this.heading,
    this.inShort,
    this.paragraphs = const [],
    this.bullets = const [],
    this.subsections = const [],
  });

  final String heading;
  final String? inShort;
  final List<String> paragraphs;
  final List<String> bullets;
  final List<PoliticaSubsection> subsections;
}

class PoliticaSubsection {
  const PoliticaSubsection({
    required this.heading,
    this.paragraphs = const [],
    this.bullets = const [],
  });

  final String heading;
  final List<String> paragraphs;
  final List<String> bullets;
}

/// Shell visual compartilhado pelas páginas em `/politica/*`.
class PoliticaPage extends StatelessWidget {
  const PoliticaPage({
    super.key,
    required this.title,
    required this.subtitle,
    this.lastUpdated,
    this.intro = const [],
    this.summaryBullets = const [],
    this.tocItems = const [],
    this.sections = const [],
    this.placeholderMessage,
  });

  final String title;
  final String subtitle;
  final String? lastUpdated;
  final List<String> intro;
  final List<String> summaryBullets;
  final List<String> tocItems;
  final List<PoliticaSection> sections;
  final String? placeholderMessage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 760;
    final hasContent =
        intro.isNotEmpty || sections.isNotEmpty || summaryBullets.isNotEmpty;

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
                        'PRIVACY POLICY',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SelectableText(
                        title,
                        style: TextStyle(
                          fontSize: isWide ? 40 : 30,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SelectableText(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.textMuted,
                          height: 1.6,
                        ),
                      ),
                      if (lastUpdated != null) ...[
                        const SizedBox(height: 8),
                        SelectableText(
                          'Last updated $lastUpdated',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textMuted,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      const SizedBox(height: 36),
                      if (placeholderMessage != null && !hasContent)
                        _PlaceholderBox(message: placeholderMessage!)
                      else ...[
                        ...intro.map(_bodyParagraph),
                        if (summaryBullets.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          const _SectionHeading(
                            'SUMMARY OF KEY POINTS',
                          ),
                          const SizedBox(height: 10),
                          SelectableText(
                            'This summary provides key points from our Privacy Notice, '
                            'but you can find out more details about any of these topics '
                            'by using our table of contents below to find the section '
                            'you are looking for.',
                            style: _bodyStyle,
                          ),
                          const SizedBox(height: 12),
                          ...summaryBullets.map(_bullet),
                        ],
                        if (tocItems.isNotEmpty) ...[
                          const SizedBox(height: 28),
                          const _SectionHeading('TABLE OF CONTENTS'),
                          const SizedBox(height: 10),
                          ...tocItems.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: SelectableText(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 20),
                        ...sections.map(
                          (section) => Padding(
                            padding: const EdgeInsets.only(bottom: 32),
                            child: _SectionBlock(section: section),
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
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

  static const TextStyle _bodyStyle = TextStyle(
    fontSize: 15,
    color: AppColors.textMuted,
    height: 1.7,
  );

  static Widget _bodyParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SelectableText(text, style: _bodyStyle),
    );
  }

  static Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.circle, size: 6, color: AppColors.accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SelectableText(text, style: _bodyStyle),
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        height: 1.3,
      ),
    );
  }
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({required this.section});

  final PoliticaSection section;

  static const TextStyle _bodyStyle = TextStyle(
    fontSize: 15,
    color: AppColors.textMuted,
    height: 1.7,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeading(section.heading),
        if (section.inShort != null) ...[
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.backgroundAlt,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE6EAFB)),
            ),
            child: SelectableText(
              'In Short: ${section.inShort}',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textDark,
                fontWeight: FontWeight.w500,
                height: 1.6,
              ),
            ),
          ),
        ],
        const SizedBox(height: 12),
        ...section.paragraphs.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SelectableText(p, style: _bodyStyle),
          ),
        ),
        ...section.bullets.map(_bullet),
        ...section.subsections.map(
          (sub) => Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  sub.heading,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryLight,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                ...sub.paragraphs.map(
                  (p) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SelectableText(p, style: _bodyStyle),
                  ),
                ),
                ...sub.bullets.map(_bullet),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.circle, size: 6, color: AppColors.accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SelectableText(text, style: _bodyStyle),
          ),
        ],
      ),
    );
  }
}

class _PlaceholderBox extends StatelessWidget {
  const _PlaceholderBox({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.backgroundAlt,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6EAFB)),
      ),
      child: SelectableText(
        message,
        style: const TextStyle(
          fontSize: 15,
          color: AppColors.textMuted,
          height: 1.6,
        ),
      ),
    );
  }
}
