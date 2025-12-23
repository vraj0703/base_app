import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/models/project_model.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';
part 'portfolio_bloc.freezed.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(const PortfolioState.initial()) {
    on<PortfolioEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(const PortfolioState.loading());
          // Simulate loading content
          await Future.delayed(const Duration(milliseconds: 800));

          final dummyProjects = [
            const ProjectModel(
              id: '1',
              title: 'NEURAL LINK',
              role: 'Lead Engineer',
              imageUrl: 'assets/images/placeholder_1.jpg',
              description: 'Brain-Computer Interface Dashboard',
              colorHex: '#FF5733',
            ),
            const ProjectModel(
              id: '2',
              title: 'MARS COLONY',
              role: 'Architect',
              imageUrl: 'assets/images/placeholder_2.jpg',
              description: 'Habitat Life Support Systems',
              colorHex: '#33FF57',
            ),
            const ProjectModel(
              id: '3',
              title: 'DEEP OCEAN',
              role: 'Researcher',
              imageUrl: 'assets/images/placeholder_3.jpg',
              description: 'Autonomous Submersible UI',
              colorHex: '#3357FF',
            ),
          ];

          emit(PortfolioState.loaded(dummyProjects));
        },
      );
    });
  }
}
