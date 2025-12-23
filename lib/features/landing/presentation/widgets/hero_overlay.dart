import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_ui_base/flutter_ui_base.dart';

class HeroOverlay extends StatefulWidget {
  const HeroOverlay({super.key});

  @override
  State<HeroOverlay> createState() => _HeroOverlayState();
}

class _HeroOverlayState extends State<HeroOverlay> {
  // Simulating role switch animation
  bool _showDeveloper = true;

  @override
  void initState() {
    super.initState();
    // Toggle role every 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _showDeveloper = !_showDeveloper);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access colors via FlutterUiBase or MyThemeStyle directly if initialized

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "FEDERICO MENEGOI",
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w900,
              letterSpacing: 4.0,
            ),
          ),
          const SizedBox(height: 20),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, anim) =>
                FadeTransition(opacity: anim, child: child),
            child: Text(
              _showDeveloper ? "DEVELOPER" : "DESIGNER",
              key: ValueKey<bool>(_showDeveloper),
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 18,
                letterSpacing: 8.0,
              ),
            ),
          ),
          const SizedBox(height: 60),
          CapsuleButton(
            text: "ENTRA", // Should use l10n: FlutterUiBase.localizations.enter
            onTap: () {
              // Navigation logic here (GoRouter)
              context.go('/portfolio');
            },
            isFilled: false,
          ),
        ],
      ),
    );
  }
}
