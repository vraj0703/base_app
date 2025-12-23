// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) =>
    _ProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      role: json['role'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      colorHex: json['colorHex'] as String,
    );

Map<String, dynamic> _$ProjectModelToJson(_ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'role': instance.role,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'colorHex': instance.colorHex,
    };
