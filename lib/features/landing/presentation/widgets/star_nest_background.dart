import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StarNestBackground extends StatefulWidget {
  const StarNestBackground({super.key});

  @override
  State<StarNestBackground> createState() => _StarNestBackgroundState();
}

class _StarNestBackgroundState extends State<StarNestBackground>
    with SingleTickerProviderStateMixin {
  ui.FragmentProgram? _program;
  late Ticker _ticker;
  double _time = 0.0;

  @override
  void initState() {
    super.initState();
    _loadShader();
    _ticker = createTicker(_onTick)..start();
  }

  Future<void> _loadShader() async {
    try {
      final program = await ui.FragmentProgram.fromAsset(
        'assets/shaders/star_nest.frag',
      );
      setState(() => _program = program);
    } catch (e) {
      debugPrint('Error loading shader: $e');
    }
  }

  void _onTick(Duration elapsed) {
    setState(() {
      _time = elapsed.inMilliseconds / 1000.0;
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_program == null) {
      return Container(color: Colors.black);
    }

    return CustomPaint(
      painter: _ShaderPainter(_program!, _time),
      child: const SizedBox.expand(),
    );
  }
}

class _ShaderPainter extends CustomPainter {
  final ui.FragmentProgram program;
  final double time;

  _ShaderPainter(this.program, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final shader = program.fragmentShader();

    // Uniform 0: uResolution (vec2)
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    // Uniform 1: uTime (float)
    shader.setFloat(2, time);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant _ShaderPainter oldDelegate) {
    return oldDelegate.time != time || oldDelegate.program != program;
  }
}
