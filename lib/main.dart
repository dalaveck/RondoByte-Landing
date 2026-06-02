import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/nav_bar.dart';
import 'widgets/scrolling_rocket.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/services_section.dart';
import 'sections/tools_section.dart';
import 'sections/contact_section.dart';

void main() => runApp(const RondoByteApp());

class RondoByteApp extends StatelessWidget {
  const RondoByteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RondoByte',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollCtrl = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _toolsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: const _SmoothScrollBehavior(),
            child: SingleChildScrollView(
              controller: _scrollCtrl,
              physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal,
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 78),
                  HeroSection(
                    onContactTap: () => _scrollTo(_contactKey),
                    onServicesTap: () => _scrollTo(_servicesKey),
                  ),
                  KeyedSubtree(key: _aboutKey, child: const AboutSection()),
                  KeyedSubtree(
                    key: _servicesKey,
                    child: const ServicesSection(),
                  ),
                  KeyedSubtree(
                    key: _toolsKey,
                    child: const ToolsSection(),
                  ),
                  KeyedSubtree(
                    key: _contactKey,
                    child: const ContactSection(),
                  ),
                ],
              ),
            ),
          ),
          ScrollingRocket(controller: _scrollCtrl),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              onAboutTap: () => _scrollTo(_aboutKey),
              onServicesTap: () => _scrollTo(_servicesKey),
              onToolsTap: () => _scrollTo(_toolsKey),
              onContactTap: () => _scrollTo(_contactKey),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmoothScrollBehavior extends MaterialScrollBehavior {
  const _SmoothScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      };

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics(),
    );
  }
}
