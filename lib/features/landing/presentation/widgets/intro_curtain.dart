import 'package:flutter/material.dart';

class IntroCurtain extends StatefulWidget {
  final VoidCallback onAnimationComplete;

  const IntroCurtain({super.key, required this.onAnimationComplete});

  @override
  State<IntroCurtain> createState() => _IntroCurtainState();
}

class _IntroCurtainState extends State<IntroCurtain>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1, milliseconds: 500), // 1.5s
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -1.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutExpo));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete();
      }
    });

    // Start delay then animate
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Center(
          child: Text(
            // Could be a loading logo here
            "LOADING...",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 4.0,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
