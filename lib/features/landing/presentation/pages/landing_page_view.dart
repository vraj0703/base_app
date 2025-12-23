import 'package:flutter/material.dart';

import '../widgets/hero_overlay.dart';
import '../widgets/intro_curtain.dart';
import '../widgets/star_nest_background.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  // We can keep the game instance here if we need to interact with it from Flutter UI
  // final LandingGame _game = LandingGame();

  bool _showOverlay = false;

  void _onIntroComplete() {
    setState(() => _showOverlay = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. The 3D/Parallax World (Shader)
          const StarNestBackground(),

          // 2. The Hero Overlay (Developers, Designer, etc)
          // Fade in after curtain reveals
          AnimatedOpacity(
            opacity: _showOverlay ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 800),
            child: const HeroOverlay(),
          ),

          // 3. The Intro Curtain (Black slide up)
          IntroCurtain(onAnimationComplete: _onIntroComplete),
        ],
      ),
    );
  }
}
