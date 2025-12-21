// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_chart_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarChartRequestModel _$StarChartRequestModelFromJson(
  Map<String, dynamic> json,
) => StarChartRequestModel(
  style: json['style'] as String,
  observer: StarChartObserver.fromJson(
    json['observer'] as Map<String, dynamic>,
  ),
  view: StarChartView.fromJson(json['view'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StarChartRequestModelToJson(
  StarChartRequestModel instance,
) => <String, dynamic>{
  'style': instance.style,
  'observer': instance.observer.toJson(),
  'view': instance.view.toJson(),
};

StarChartObserver _$StarChartObserverFromJson(Map<String, dynamic> json) =>
    StarChartObserver(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$StarChartObserverToJson(StarChartObserver instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'date': instance.date,
    };

StarChartView _$StarChartViewFromJson(Map<String, dynamic> json) =>
    StarChartView(
      type: json['type'] as String,
      parameters: StarChartParameters.fromJson(
        json['parameters'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$StarChartViewToJson(StarChartView instance) =>
    <String, dynamic>{
      'type': instance.type,
      'parameters': instance.parameters.toJson(),
    };

StarChartParameters _$StarChartParametersFromJson(Map<String, dynamic> json) =>
    StarChartParameters(
      constellation: json['constellation'] as String,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      constellationlines: json['constellation_lines'] as bool?,
      constellationlimits: json['constellation_limits'] as bool?,
      constellationnames: json['constellation_names'] as bool?,
      starnames: json['star_names'] as bool?,
      gridlines: json['grid_lines'] as bool?,
      milkyway: json['milky_way'] as bool?,
    );

Map<String, dynamic> _$StarChartParametersToJson(
  StarChartParameters instance,
) => <String, dynamic>{
  'constellation': instance.constellation,
  'width': ?instance.width,
  'height': ?instance.height,
  'constellation_lines': ?instance.constellationlines,
  'constellation_limits': ?instance.constellationlimits,
  'constellation_names': ?instance.constellationnames,
  'star_names': ?instance.starnames,
  'grid_lines': ?instance.gridlines,
  'milky_way': ?instance.milkyway,
};
