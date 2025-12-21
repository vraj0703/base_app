import 'package:json_annotation/json_annotation.dart';

part 'star_chart_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StarChartRequestModel {
  @JsonKey(name: 'style')
  final String style;
  @JsonKey(name: 'observer')
  final StarChartObserver observer;
  @JsonKey(name: 'view')
  final StarChartView view;

  StarChartRequestModel({
    required this.style,
    required this.observer,
    required this.view,
  });

  Map<String, dynamic> toJson() => _$StarChartRequestModelToJson(this);

  factory StarChartRequestModel.fromJson(Map<String, dynamic> json) {
    return _$StarChartRequestModelFromJson(json);
  }
}

@JsonSerializable()
class StarChartObserver {
  final double latitude;
  final double longitude;
  final String date; // YYYY-MM-DD

  StarChartObserver({
    required this.latitude,
    required this.longitude,
    required this.date,
  });

  Map<String, dynamic> toJson() => _$StarChartObserverToJson(this);

  factory StarChartObserver.fromJson(Map<String, dynamic> json) {
    return _$StarChartObserverFromJson(json);
  }
}

@JsonSerializable(explicitToJson: true)
class StarChartView {
  final String type;
  final StarChartParameters parameters;

  StarChartView({required this.type, required this.parameters});

  Map<String, dynamic> toJson() => _$StarChartViewToJson(this);

  factory StarChartView.fromJson(Map<String, dynamic> json) {
    return _$StarChartViewFromJson(json);
  }
}

@JsonSerializable()
class StarChartParameters {
  final String constellation; // 3-letter constellation ID, e.g., "ori"
  @JsonKey(includeIfNull: false)
  final int? width;
  @JsonKey(includeIfNull: false)
  final int? height;

  StarChartParameters({required this.constellation, this.width, this.height});

  Map<String, dynamic> toJson() => _$StarChartParametersToJson(this);

  factory StarChartParameters.fromJson(Map<String, dynamic> json) {
    return _$StarChartParametersFromJson(json);
  }
}
