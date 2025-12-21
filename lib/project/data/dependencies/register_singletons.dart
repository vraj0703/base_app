import 'package:flutter_core/core/logic/native_widget_service.dart';
import 'package:get_it/get_it.dart';
import 'package:my_localizations/library.dart';
import 'package:base_app/project/domain/logic/app_logic.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter_core/core/network/rest_api_client.dart';
import 'package:flutter_core/core/network/gql_client.dart';
import 'package:flutter_core/core/typedef/typedef.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// Create singletons (logic and services) that can be shared across the app.
void registerSingletons() {
  // Top level app controller
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());

  // Localizations
  GetIt.I.registerLazySingleton<MyLocalizations>(() => MyLocalizations());

  // Home Widget Service
  GetIt.I.registerLazySingleton<NativeWidgetService>(
    () => NativeWidgetService(),
  );

  // Network Clients (Dummies for now, as BaseRepository requires them but we don't use them)
  GetIt.I.registerLazySingleton<RestApiClient>(() => DummyRestApiClient());
  GetIt.I.registerLazySingleton<GQLClient>(() => DummyGQLClient());
}

class DummyRestApiClient implements RestApiClient {
  @override
  Future<http.Response> delete(String endpoint) async => http.Response('', 200);

  @override
  Future<Uint8List> downloadFile(String endpoint) async => Uint8List(0);

  @override
  Future<String> get(String endpoint) async => '';

  @override
  Future<String> multiPartRequest({
    required File fileToUpload,
    required String endpoint,
    OnUploadProgressCallback? uploadCallback,
    String? fileMediaType,
    String fileFieldName = 'file',
  }) async => '';

  @override
  Future<http.Response> post(
    String endpoint,
    Map<String, dynamic>? body,
  ) async => http.Response('', 200);

  @override
  Future<http.Response> postObject(Object? body, String endpoint) async =>
      http.Response('', 200);

  @override
  Future<http.Response> put({
    required String endpoint,
    String? contentType,
    String? body,
    bool forceRefresh = false,
  }) async => http.Response('', 200);

  @override
  Future<http.Response> putMap(
    String endpoint,
    Map<String, dynamic>? body,
  ) async => http.Response('', 200);
}

class DummyGQLClient implements GQLClient {
  @override
  Future<Map<String, dynamic>?> mutation(
    MutationOptions<Mutation> mutation,
  ) async => {};

  @override
  Future<Map<String, dynamic>> query(QueryOptions<Query> query) async => {};
}
