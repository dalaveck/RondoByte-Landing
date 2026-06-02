import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ToolTopBar extends StatelessWidget {
  const ToolTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 760;
    return Container(
      height: 78,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE6EAFB), width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: isWide ? 48 : 20),
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                '/',
                (_) => false,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 60,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (_, __, ___) =>
                        const SizedBox(height: 60, width: 60),
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
                ],
              ),
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
              '/',
              (_) => false,
            ),
            icon: const Icon(Icons.arrow_back_rounded, size: 18),
            label: const Text('Voltar'),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
