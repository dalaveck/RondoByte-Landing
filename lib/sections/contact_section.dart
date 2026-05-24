import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'FALE CONOSCO',
                style: TextStyle(
                  color: Color(0xFF9AB0FF),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Vamos colocar seu projeto em órbita?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isWide ? 40 : 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Conecte-se com a RondoByte pelas nossas redes ou envie um email. '
                'Estamos prontos para conversar sobre sua próxima ideia.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.7,
                  color: Color(0xFFC9D2FF),
                ),
              ),
              const SizedBox(height: 44),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 18,
                runSpacing: 18,
                children: [
                  _ContactCard(
                    icon: Icons.email_rounded,
                    label: 'Email',
                    value: 'RondoByte@gmail.com',
                    onTap: () => _open('mailto:RondoByte@gmail.com'),
                  ),
                  _ContactCard(
                    icon: Icons.camera_alt_rounded,
                    label: 'Instagram',
                    value: '@rondobyte',
                    onTap: () => _open('https://instagram.com/rondobyte'),
                  ),
                  _ContactCard(
                    icon: Icons.business_center_rounded,
                    label: 'LinkedIn',
                    value: 'linkedin.com/company/...',
                    onTap: () => _open(
                      'https://www.linkedin.com/company/112506054',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Container(
                height: 1,
                color: Colors.white.withOpacity(0.12),
              ),
              const SizedBox(height: 22),
              const Text(
                '© RondoByte. Construído com Flutter.',
                style: TextStyle(
                  color: Color(0xFF9AB0FF),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          width: 260,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: _hover
                ? Colors.white
                : Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(_hover ? 1 : 0.18),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: _hover
                      ? AppColors.primary.withOpacity(0.1)
                      : Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.icon,
                  color: _hover ? AppColors.primary : Colors.white,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: _hover
                            ? AppColors.textMuted
                            : const Color(0xFF9AB0FF),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: _hover ? AppColors.primary : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
