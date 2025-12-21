import 'dart:async';

import 'package:base_app/features/constellations_sky/domain/entities/star_chart_params.dart';
import 'package:base_app/features/constellations_sky/presentation/pages/constellations_page.dart';
import 'package:base_app/features/constellations_sky/presentation/states/constellations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockConstellationsCubit extends Mock implements ConstellationsCubit {}

// Fake StarChartParams for checking arguments
class FakeStarChartParams extends Fake implements StarChartParams {}

void main() {
  late MockConstellationsCubit mockCubit;

  setUpAll(() {
    registerFallbackValue(FakeStarChartParams());
  });

  setUp(() {
    mockCubit = MockConstellationsCubit();
    GetIt.I.registerFactory<ConstellationsCubit>(() => mockCubit);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  testWidgets('ConstellationsPage renders and validates inputs', (
    WidgetTester tester,
  ) async {
    // Stub the state stream and current state
    when(
      () => mockCubit.stream,
    ).thenAnswer((_) => Stream.value(const ConstellationsState.initial()));
    when(() => mockCubit.state).thenReturn(const ConstellationsState.initial());

    // Stub close to do nothing
    when(() => mockCubit.close()).thenAnswer((_) async {});

    // Stub generateStarChart
    when(() => mockCubit.generateStarChart(any())).thenAnswer((_) async {});

    await tester.pumpWidget(const MaterialApp(home: ConstellationsPage()));

    // Verify initial UI
    expect(find.text('Constellations Sky'), findsOneWidget);

    // Enter details
    await tester.enterText(find.widgetWithText(TextField, 'Latitude'), '10.5');
    await tester.enterText(find.widgetWithText(TextField, 'Longitude'), '20.0');

    // Tap generate
    await tester.tap(find.text('Generate Star Chart'));
    await tester.pump();

    // Verify call
    verify(() => mockCubit.generateStarChart(any())).called(1);
  });
}
