import 'dart:convert';
import 'package:base_app/features/constellations_sky/data/models/star_chart_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Verify StarChartRequestModel serialization', () {
    final model = StarChartRequestModel(
      style: 'inverted',
      observer: StarChartObserver(
        latitude: 0,
        longitude: 0,
        date: '2023-01-01',
      ),
      view: StarChartView(
        type: 'constellation',
        parameters: StarChartParameters(
          constellation: 'ori',
          width: 1000,
          height: 1000,
        ),
      ),
    );

    final json = model.toJson();
    print('Serialized JSON:');
    print(jsonEncode(json));

    // Assert that the keys are snake_case as expected
    final params = json['view']['parameters'] as Map<String, dynamic>;
    expect(
      params.containsKey('constellation_lines'),
      isTrue,
      reason: 'Should have constellation_lines key',
    );
    expect(
      params.containsKey('constellation_names'),
      isTrue,
      reason: 'Should have constellation_names key',
    );
    expect(params['constellation_lines'], isTrue);
    expect(params['constellation_names'], isFalse);
  });
}
