import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A rocket that climbs to the top of the page as the user scrolls down.
/// Listens to a [ScrollController] and uses the scroll fraction to interpolate
/// its bottom offset.
class ScrollingRocket extends StatefulWidget {
  final ScrollController controller;

  const ScrollingRocket({super.key, required this.controller});

  @override
  State<ScrollingRocket> createState() => _ScrollingRocketState();
}

class _ScrollingRocketState extends State<ScrollingRocket>
    with SingleTickerProviderStateMixin {
  double _fraction = 0;
  late final AnimationController _hoverCtrl;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
    _hoverCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
  }

  void _onScroll() {
    final pos = widget.controller.position;
    final max = pos.maxScrollExtent;
    if (max <= 0) return;
    final f = (pos.pixels / max).clamp(0.0, 1.0);
    if ((f - _fraction).abs() > 0.001) {
      setState(() => _fraction = f);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    _hoverCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final travel = size.height - 220;
    final bottom = 24 + travel * _fraction;
    final rotation = -0.05 + 0.02 * _fraction;

    return Positioned(
      right: size.width > 900 ? 56 : 18,
      bottom: bottom,
      child: IgnorePointer(
        child: AnimatedBuilder(
          animation: _hoverCtrl,
          builder: (context, child) {
            final dy = (_hoverCtrl.value - 0.5) * 8;
            return Transform.translate(
              offset: Offset(0, dy),
              child: Transform.rotate(angle: rotation, child: child),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/images/rocket.svg',
                height: size.width > 900 ? 140 : 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
