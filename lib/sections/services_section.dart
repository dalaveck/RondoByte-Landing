import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const _services = <_Service>[
    _Service(
      icon: Icons.phone_android_rounded,
      title: 'Aplicativos Mobile',
      description:
          'Apps Android e iOS desenvolvidos em Flutter, com performance nativa '
          'e uma única base de código.',
    ),
    _Service(
      icon: Icons.dashboard_customize_rounded,
      title: 'Sistemas Web',
      description:
          'Sistemas web responsivos e escaláveis, integrados a APIs robustas '
          'e infraestrutura moderna.',
    ),
    _Service(
      icon: Icons.language_rounded,
      title: 'Websites',
      description:
          'Landing pages e sites institucionais que comunicam sua marca com '
          'design e velocidade.',
    ),
    _Service(
      icon: Icons.support_agent_rounded,
      title: 'Consultoria',
      description:
          'Apoio especializado em arquitetura, escolha de stack e boas '
          'práticas para acelerar seu projeto.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 900;
    final cross = width > 1100 ? 4 : (width > 720 ? 2 : 2);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 96 : 24,
        vertical: isWide ? 110 : 70,
      ),
      color: AppColors.backgroundAlt,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'NOSSOS SERVIÇOS',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'O que entregamos para você.',
                style: TextStyle(
                  fontSize: isWide ? 38 : 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  const spacing = 18.0;
                  final tileWidth =
                      (constraints.maxWidth - spacing * (cross - 1)) / cross;
                  final tileHeight = cross == 1 ? 150.0 : 230.0;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _services.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cross,
                      mainAxisSpacing: spacing,
                      crossAxisSpacing: spacing,
                      childAspectRatio: tileWidth / tileHeight,
                    ),
                    itemBuilder: (_, i) =>
                        _ServiceCard(service: _services[i]),
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

class _Service {
  final IconData icon;
  final String title;
  final String description;
  const _Service({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class _ServiceCard extends StatefulWidget {
  final _Service service;
  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(20),
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
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.service.icon,
                color: AppColors.primary,
                size: 22,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              widget.service.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                widget.service.description,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.5,
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
