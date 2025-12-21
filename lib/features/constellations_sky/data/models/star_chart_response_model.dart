import 'package:json_annotation/json_annotation.dart';

part 'star_chart_response_model.g.dart';

@JsonSerializable()
class StarChartResponseModel {
  @JsonKey(name: 'data')
  final StarChartData? data;

  StarChartResponseModel({this.data});

  factory StarChartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StarChartResponseModelFromJson(json);
}

@JsonSerializable()
class StarChartData {
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;

  StarChartData({this.imageUrl});

  factory StarChartData.fromJson(Map<String, dynamic> json) =>
      _$StarChartDataFromJson(json);
}
