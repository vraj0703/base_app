import 'package:flutter/material.dart';
import '../../domain/models/project_model.dart';
import 'package:flutter_ui_base/flutter_ui_base.dart';
import 'package:go_router/go_router.dart';

class ProjectDetailPage extends StatelessWidget {
  final String projectId;
  // In a real app, we might fetch the project by ID here.
  // For now, we'll just show a placeholder or expect data passed via extra (if GoRouter supported clean obj passing easily).
  // Better yet, we use the ID to find it from a provider/bloc.
  // To keep it simple for this replica, we will simulate fetching or just use the ID.

  const ProjectDetailPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark theme
      body: Stack(
        children: [
          // Background Image (Hero)
          Positioned.fill(
            child: Hero(
              tag: 'project_bg_$projectId',
              child: Container(
                color: Colors.grey[900], // Placeholder for image
                child: Center(
                  child: Icon(Icons.image, size: 100, color: Colors.white10),
                ),
              ),
            ),
          ),

          // Content Scroll
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  CapsuleButton(text: "BACK", onTap: () => context.pop()),
                  const SizedBox(height: 60),

                  // Title (Hero)
                  Hero(
                    tag: 'project_title_$projectId',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        "PROJECT $projectId",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                          fontWeight: FontWeight.w900,
                          height: 0.9,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Detail Text
                  Text(
                    "This is a deep dive into the project. Use this space to describe the challenge, solution, and impact.\n" *
                        5,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 60),
                  Container(
                    height: 400,
                    color: Colors.white10,
                    child: const Center(
                      child: Text(
                        "VIDEO / GALLERY PLACEHOLDER",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
