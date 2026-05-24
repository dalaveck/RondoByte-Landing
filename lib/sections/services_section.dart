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
      icon: Icons.extension_rounded,
      title: 'Bibliotecas Flutter',
      description:
          'Aproveitamos o ecossistema Flutter ao máximo para acelerar entregas '
          'sem abrir mão de qualidade.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 900;
    final cross = width > 1100 ? 4 : (width > 720 ? 2 : 1);

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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cross,
                  mainAxisSpacing: 22,
                  crossAxisSpacing: 22,
                  childAspectRatio: cross == 1 ? 2.4 : 0.95,
                ),
                itemBuilder: (_, i) => _ServiceCard(service: _services[i]),
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
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                widget.service.icon,
                color: AppColors.primary,
                size: 28,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.service.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                widget.service.description,
                style: const TextStyle(
                  fontSize: 14,
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
