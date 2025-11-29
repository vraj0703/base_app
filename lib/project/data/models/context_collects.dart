import 'dart:ui';

class ContextCollects {
  final Size? screenSize;
  final bool disableAnimations;
  final bool highContrast;

  ContextCollects({
    required this.screenSize,
    this.disableAnimations = false,
    this.highContrast = false,
  });
}
