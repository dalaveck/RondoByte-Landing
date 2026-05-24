import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;
  final VoidCallback onServicesTap;

  const HeroSection({
    super.key,
    required this.onContactTap,
    required this.onServicesTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 96 : 24,
        vertical: isWide ? 120 : 80,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.background,
            AppColors.backgroundAlt,
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'TECNOLOGIA · FLUTTER · INOVAÇÃO',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 820),
                child: Text(
                  'Construímos aplicativos, sistemas e websites que decolam.',
                  style: TextStyle(
                    fontSize: isWide ? 56 : 36,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Text(
                  'A RondoByte é formada por pessoas que vivem tecnologia. '
                  'Nosso foco é entregar produtos digitais de alta performance '
                  'utilizando Flutter e seu poderoso ecossistema de bibliotecas.',
                  style: TextStyle(
                    fontSize: isWide ? 19 : 16,
                    height: 1.6,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  ElevatedButton.icon(
                    onPressed: onContactTap,
                    icon: const Icon(Icons.rocket_launch_rounded, size: 20),
                    label: const Text('Fale conosco'),
                  ),
                  OutlinedButton(
                    onPressed: onServicesTap,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(
                        color: AppColors.primary,
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    child: const Text('Conheça nossos serviços'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
