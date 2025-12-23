import 'package:flame/game.dart';
import 'package:flame/events.dart';

import 'package:flutter/material.dart';

import 'components/parallax_bg.dart';

class LandingGame extends FlameGame with MouseMovementDetector {
  LandingGame();

  late ParallaxBg _parallaxBg;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Set background to black (using internal Color, not Viewport Component)
    // Note: FlameGame has backgroundColor method override.

    // Add Parallax Components
    _parallaxBg = ParallaxBg();
    add(_parallaxBg);
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    if (!isLoaded) return;
    final center = size / 2;
    // Calculate normalized position (-1 to 1)
    final relativeX = (info.eventPosition.global.x - center.x) / center.x;
    _parallaxBg.updateSensor(relativeX);
  }

  @override
  Color backgroundColor() => const Color(0xFF000000);
}
