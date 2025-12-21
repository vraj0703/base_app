import 'package:freezed_annotation/freezed_annotation.dart';

part 'star_chart_params.freezed.dart';

@freezed
abstract class StarChartParams with _$StarChartParams {
  const factory StarChartParams({
    required double latitude,
    required double longitude,
    required DateTime date,
    @Default('default') String style,
    @Default('ori') String constellationId,
  }) = _StarChartParams;
}
