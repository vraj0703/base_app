import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/blocs/portfolio_bloc.dart';
import '../widgets/portfolio_slider.dart';
import 'package:base_app/features/landing/presentation/widgets/star_nest_background.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PortfolioBloc()..add(const PortfolioEvent.started()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<PortfolioBloc, PortfolioState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
              loaded: (projects) => Stack(
                children: [
                  Positioned.fill(child: const StarNestBackground()),
                  PortfolioSlider(projects: projects),
                ],
              ),
              error: (msg) => Center(child: Text("Error: $msg")),
            );
          },
        ),
      ),
    );
  }
}
