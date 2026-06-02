import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ToolsSection extends StatelessWidget {
  const ToolsSection({super.key});

  static const _tools = <_Tool>[
    _Tool(
      icon: Icons.swap_horiz_rounded,
      title: 'OFX → CSV',
      description:
          'Converta extratos bancários no formato OFX para planilhas CSV '
          'prontas para usar no Excel, Google Sheets ou softwares contábeis.',
      status: _ToolStatus.comingSoon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 900;
    final cross = width > 1100 ? 3 : (width > 720 ? 2 : 2);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 96 : 24,
        vertical: isWide ? 110 : 70,
      ),
      color: AppColors.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
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
              const SizedBox(height: 16),
              Text(
                'Ferramentas de conversão online.',
                style: TextStyle(
                  fontSize: isWide ? 38 : 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 12),
              const ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 720),
                child: Text(
                  'Conversores rápidos e gratuitos que estamos desenvolvendo '
                  'para facilitar o seu dia a dia.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  const spacing = 18.0;
                  final tileWidth =
                      (constraints.maxWidth - spacing * (cross - 1)) / cross;
                  final tileHeight = cross == 1 ? 180.0 : 240.0;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _tools.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cross,
                      mainAxisSpacing: spacing,
                      crossAxisSpacing: spacing,
                      childAspectRatio: tileWidth / tileHeight,
                    ),
                    itemBuilder: (_, i) => _ToolCard(tool: _tools[i]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _ToolStatus { comingSoon, available }

class _Tool {
  final IconData icon;
  final String title;
  final String description;
  final _ToolStatus status;
  final String? url;

  const _Tool({
    required this.icon,
    required this.title,
    required this.description,
    required this.status,
    this.url,
  });
}

class _ToolCard extends StatefulWidget {
  final _Tool tool;
  const _ToolCard({required this.tool});

  @override
  State<_ToolCard> createState() => _ToolCardState();
}

class _ToolCardState extends State<_ToolCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final available = widget.tool.status == _ToolStatus.available;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hover ? AppColors.accent : const Color(0xFFE6EAFB),
            width: _hover ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _hover
                  ? const Color(0x224A6BFF)
                  : const Color(0x0F0D1F6E),
              blurRadius: _hover ? 28 : 16,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    widget.tool.icon,
                    color: AppColors.primary,
                    size: 22,
                  ),
                ),
                const Spacer(),
                _StatusBadge(available: available),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.tool.title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                widget.tool.description,
                style: const TextStyle(
                  fontSize: 13.5,
                  height: 1.55,
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool available;
  const _StatusBadge({required this.available});

  @override
  Widget build(BuildContext context) {
    final color = available ? const Color(0xFF1F9D55) : AppColors.accent;
    final label = available ? 'Disponível' : 'Em breve';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
