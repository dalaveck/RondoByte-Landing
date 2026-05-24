import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onServicesTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onAboutTap,
    required this.onServicesTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 760;
    return Container(
      height: 78,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.92),
        border: const Border(
          bottom: BorderSide(color: Color(0xFFE6EAFB), width: 1),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: isWide ? 48 : 20),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            height: 56,
          ),
          const SizedBox(width: 14),
          const Text(
            'RondoByte',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          if (isWide) ...[
            _NavLink(label: 'Sobre', onTap: onAboutTap),
            const SizedBox(width: 28),
            _NavLink(label: 'Serviços', onTap: onServicesTap),
            const SizedBox(width: 28),
            _NavLink(label: 'Fale Conosco', onTap: onContactTap),
            const SizedBox(width: 28),
            ElevatedButton(
              onPressed: onContactTap,
              child: const Text('Trabalhe com a gente'),
            ),
          ] else
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.primary),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('Sobre'),
                          onTap: () {
                            Navigator.pop(context);
                            onAboutTap();
                          },
                        ),
                        ListTile(
                          title: const Text('Serviços'),
                          onTap: () {
                            Navigator.pop(context);
                            onServicesTap();
                          },
                        ),
                        ListTile(
                          title: const Text('Fale Conosco'),
                          onTap: () {
                            Navigator.pop(context);
                            onContactTap();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: _hover ? AppColors.accent : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
