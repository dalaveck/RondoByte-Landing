import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A rocket that climbs to the top of the page as the user scrolls down.
/// Uses a [ValueNotifier] so only the rocket repaints on scroll — the rest of
/// the page stays untouched, keeping mobile scroll smooth.
class ScrollingRocket extends StatefulWidget {
  final ScrollController controller;

  const ScrollingRocket({super.key, required this.controller});

  @override
  State<ScrollingRocket> createState() => _ScrollingRocketState();
}

class _ScrollingRocketState extends State<ScrollingRocket>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> _fraction = ValueNotifier<double>(0);
  late final AnimationController _hoverCtrl;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
    _hoverCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
  }

  void _onScroll() {
    final pos = widget.controller.position;
    final max = pos.maxScrollExtent;
    if (max <= 0) return;
    final f = (pos.pixels / max).clamp(0.0, 1.0);
    if ((f - _fraction.value).abs() > 0.002) {
      _fraction.value = f;
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    _hoverCtrl.dispose();
    _fraction.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 900;
    final rocketHeight = isWide ? 140.0 : 80.0;
    final travel = size.height - rocketHeight - 100;

    final rocket = RepaintBoundary(
      child: SvgPicture.asset(
        'assets/images/rocket.svg',
        height: rocketHeight,
      ),
    );

    final floating = AnimatedBuilder(
      animation: _hoverCtrl,
      builder: (context, child) {
        final dy = (_hoverCtrl.value - 0.5) * 6;
        return Transform.translate(offset: Offset(0, dy), child: child);
      },
      child: rocket,
    );

    return Positioned.fill(
      child: IgnorePointer(
        child: ValueListenableBuilder<double>(
          valueListenable: _fraction,
          builder: (context, f, child) {
            final bottom = 24 + travel * f;
            return Stack(
              children: [
                Positioned(
                  right: isWide ? 56 : 16,
                  bottom: bottom,
                  child: child!,
                ),
              ],
            );
          },
          child: floating,
        ),
      ),
    );
  }
}
