import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../landing_game.dart';

class ParallaxBg extends PositionComponent with HasGameReference<LandingGame> {
  late PositionComponent layerFar;
  late PositionComponent layerMid;
  // late SpriteComponent layerNear;

  double _sensorX = 0.0;
  final double speedFactor = 20.0;

  @override
  Future<void> onLoad() async {
    // Ideally loading sprites here. For now, we use colored rectangles as placeholders
    // until assets are generated.

    // Placeholder for Star Layer
    layerFar = RectangleComponent(
      paint: Paint()..color = Colors.white.withValues(alpha: 0.1),
      size: Vector2(100, 100),
      position: Vector2(game.size.x / 2, game.size.y / 4),
      anchor: Anchor.center,
    );

    // Placeholder for Planet Layer
    layerMid = RectangleComponent(
      paint: Paint()..color = Colors.grey.withValues(alpha: 0.5),
      size: Vector2(300, 300),
      position: Vector2(game.size.x / 2, game.size.y / 2),
      anchor: Anchor.center,
    );

    add(layerFar);
    add(layerMid);
  }

  void updateSensor(double xRel) {
    // xRel is -1.0 to 1.0 based on mouse position from center
    _sensorX = xRel;
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Simple parallax math
    final targetXFar = _sensorX * speedFactor * 0.5;
    final targetXMid = _sensorX * speedFactor * 1.5;

    // Linear interpolation for smoothness (or use a spring sim)
    layerFar.x += (targetXFar + (game.size.x / 2) - layerFar.x) * 5 * dt;
    layerMid.x += (targetXMid + (game.size.x / 2) - layerMid.x) * 5 * dt;
  }
}
