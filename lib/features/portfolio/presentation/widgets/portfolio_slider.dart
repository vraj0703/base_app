import 'package:flutter/material.dart';
import '../../domain/models/project_model.dart';
import 'project_card.dart';

class PortfolioSlider extends StatefulWidget {
  final List<ProjectModel> projects;

  const PortfolioSlider({super.key, required this.projects});

  @override
  State<PortfolioSlider> createState() => _PortfolioSliderState();
}

class _PortfolioSliderState extends State<PortfolioSlider> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: widget.projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: widget.projects[index]);
      },
    );
  }
}
