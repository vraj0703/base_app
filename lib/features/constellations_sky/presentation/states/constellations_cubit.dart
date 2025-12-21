import 'package:base_app/features/constellations_sky/domain/entities/star_chart_params.dart';
import 'package:base_app/features/constellations_sky/domain/use_cases/generate_star_chart_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'constellations_cubit.freezed.dart';

@freezed
class ConstellationsState with _$ConstellationsState {
  const factory ConstellationsState.initial() = _Initial;
  const factory ConstellationsState.loading() = _Loading;
  const factory ConstellationsState.success(String imageUrl) = _Success;
  const factory ConstellationsState.error(String message) = _Error;
}

@injectable
class ConstellationsCubit extends Cubit<ConstellationsState> {
  final GenerateStarChartUseCase _useCase;

  ConstellationsCubit(this._useCase)
    : super(const ConstellationsState.initial());

  Future<void> generateStarChart(StarChartParams params) async {
    emit(const ConstellationsState.loading());
    final result = await _useCase(params);
    result.fold(
      ifLeft: (e) => emit(ConstellationsState.error(e.toString())),
      ifRight: (url) => emit(ConstellationsState.success(url)),
    );
  }
}
