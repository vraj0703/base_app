import 'package:dart_either/dart_either.dart';
import 'package:flutter_core/library.dart';
import 'package:base_app/features/constellations_sky/domain/entities/star_chart_params.dart';

abstract class IStarChartRepository {
  Future<Either<Exception, String>> generateStarChart(StarChartParams params);
}
