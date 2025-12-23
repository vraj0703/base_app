import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';

part 'project_model.g.dart';

@freezed
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required String id,
    required String title,
    required String role,
    required String imageUrl, // Placeholder for now, or asset path
    required String description,
    required String colorHex, // Dominant color for background/accents
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
