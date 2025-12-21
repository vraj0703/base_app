import 'package:base_app/features/constellations_sky/domain/entities/star_chart_params.dart';
import 'package:base_app/features/constellations_sky/domain/repositories/star_chart_repository.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_core/library.dart';
import 'package:injectable/injectable.dart';

@injectable
class GenerateStarChartUseCase {
  final IStarChartRepository _repository;

  GenerateStarChartUseCase(this._repository);

  Future<Either<Exception, String>> call(StarChartParams params) {
    return _repository.generateStarChart(params);
  }
}
