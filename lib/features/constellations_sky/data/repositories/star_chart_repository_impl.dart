import 'dart:convert';
import 'package:base_app/features/constellations_sky/data/dependencies/api_constants.dart';
import 'package:base_app/features/constellations_sky/data/models/star_chart_request_model.dart';
import 'package:base_app/features/constellations_sky/data/models/star_chart_response_model.dart';
import 'package:base_app/features/constellations_sky/domain/entities/star_chart_params.dart';
import 'package:base_app/features/constellations_sky/domain/repositories/star_chart_repository.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_core/core/network/gql_client.dart';
import 'package:flutter_core/core/repository/repository.dart';
import 'package:flutter_core/library.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: IStarChartRepository)
class StarChartRepositoryImpl extends BaseRepository
    implements IStarChartRepository {
  StarChartRepositoryImpl({
    required super.apiClient,
    required GQLClient gqlClient,
  }) : super(gqlClient: gqlClient);

  @override
  Future<Either<Exception, String>> generateStarChart(
    StarChartParams params,
  ) async {
    // Safeguard: Validate style against known API enum
    const validStyles = ['default', 'inverted', 'red', 'navy'];
    final style = validStyles.contains(params.style)
        ? params.style
        : 'inverted';

    final requestBody = StarChartRequestModel(
      style: style,
      observer: StarChartObserver(
        latitude: params.latitude,
        longitude: params.longitude,
        date: params.date.apiFormattedString,
      ),
      view: StarChartView(
        type: 'constellation',
        parameters: StarChartParameters(
          constellation: params.constellationId,
          width: 2160,
          height: 2160,
          // "Mimic Reference" settings (Clean Style)
          constellationlines: true,
          constellationlimits: false,
          constellationnames: false,
          starnames: false,
          gridlines: false,
          milkyway: false,
        ),
      ),
    );

    // Basic Auth Header
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('${ApiConstants.appId}:${ApiConstants.appSecret}'))}';

    try {
      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.starChartEndpoint}'),
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody.toJson()),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body);
        final model = StarChartResponseModel.fromJson(data);
        if (model.data?.imageUrl == null) {
          return Left(Exception('No image URL in response'));
        }
        return Right(model.data!.imageUrl!);
      } else {
        return Left(
          Exception('API Error: ${response.statusCode} ${response.body}'),
        );
      }
    } catch (e) {
      return Left(e is Exception ? e : Exception(e.toString()));
    }
  }
}
