import 'package:base_app/features/constellations_sky/domain/entities/star_chart_params.dart';
import 'package:base_app/features/constellations_sky/domain/use_cases/generate_star_chart_use_case.dart';
import 'package:base_app/features/constellations_sky/presentation/states/constellations_cubit.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGenerateStarChartUseCase extends Mock
    implements GenerateStarChartUseCase {}

void main() {
  late ConstellationsCubit cubit;
  late MockGenerateStarChartUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGenerateStarChartUseCase();
    cubit = ConstellationsCubit(mockUseCase);
  });

  final tParams = StarChartParams(
    latitude: 0,
    longitude: 0,
    date: DateTime(2023, 1, 1),
  );
  const tUrl = 'https://example.com/chart.png';

  test('initial state is ConstellationsState.initial', () {
    expect(cubit.state, const ConstellationsState.initial());
  });

  test(
    'emits [loading, success] when star chart generation succeeds',
    () async {
      when(
        () => mockUseCase(tParams),
      ).thenAnswer((_) async => const Right(tUrl));

      expectLater(
        cubit.stream,
        emitsInOrder([
          const ConstellationsState.loading(),
          const ConstellationsState.success(tUrl),
        ]),
      );

      await cubit.generateStarChart(tParams);
    },
  );

  test('emits [loading, error] when star chart generation fails', () async {
    when(
      () => mockUseCase(tParams),
    ).thenAnswer((_) async => Left(Exception('Failed')));

    expectLater(
      cubit.stream,
      emitsInOrder([
        const ConstellationsState.loading(),
        const ConstellationsState.error('Exception: Failed'),
      ]),
    );

    await cubit.generateStarChart(tParams);
  });
}
