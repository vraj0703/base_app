import 'package:flutter/material.dart';
import '../../domain/models/project_model.dart';
import 'package:flutter_ui_base/flutter_ui_base.dart';
import 'package:go_router/go_router.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  void _onEnter() {
    context.go('/portfolio/project/${widget.project.id}');
  }

  @override
  Widget build(BuildContext context) {
    // Parse hex color
    final color = _parseColor(widget.project.colorHex);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background (Simulated Image for now)
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            decoration: BoxDecoration(
              color: color.withOpacity(_isHovered ? 0.8 : 0.6),
              border: Border.all(
                color: _isHovered ? Colors.white : Colors.transparent,
                width: 2,
              ),
            ),
          ),

          // Content Overlay
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Role
                Text(
                  widget.project.role.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white70,
                    letterSpacing: 2.0,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // Title (Big)
                Text(
                  widget.project.title.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    height: 0.9,
                  ),
                ),
                const SizedBox(height: 20),

                // Description
                Text(
                  widget.project.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),

                // Action Button
                CapsuleButton(
                  text: "VIEW PROJECT",
                  onTap: _onEnter,
                  isFilled: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _parseColor(String hexString) {
    try {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return Colors.grey;
    }
  }
}
