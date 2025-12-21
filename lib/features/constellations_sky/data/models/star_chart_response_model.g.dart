// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_chart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarChartResponseModel _$StarChartResponseModelFromJson(
  Map<String, dynamic> json,
) => StarChartResponseModel(
  data: json['data'] == null
      ? null
      : StarChartData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StarChartResponseModelToJson(
  StarChartResponseModel instance,
) => <String, dynamic>{'data': instance.data};

StarChartData _$StarChartDataFromJson(Map<String, dynamic> json) =>
    StarChartData(imageUrl: json['imageUrl'] as String?);

Map<String, dynamic> _$StarChartDataToJson(StarChartData instance) =>
    <String, dynamic>{'imageUrl': instance.imageUrl};
