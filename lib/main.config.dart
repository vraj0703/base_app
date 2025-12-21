// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_app/features/constellations_sky/data/repositories/star_chart_repository_impl.dart'
    as _i867;
import 'package:base_app/features/constellations_sky/domain/repositories/star_chart_repository.dart'
    as _i507;
import 'package:base_app/features/constellations_sky/domain/use_cases/generate_star_chart_use_case.dart'
    as _i906;
import 'package:base_app/features/constellations_sky/presentation/states/constellations_cubit.dart'
    as _i557;
import 'package:base_app/project/data/use_cases/load_json_use_case.dart'
    as _i787;
import 'package:flutter_core/core/network/gql_client.dart' as _i771;
import 'package:flutter_core/core/repository/json_repository.dart' as _i167;
import 'package:flutter_core/library.dart' as _i356;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i167.ILocalJsonRepository>(() => _i787.LocalJsonRepository());
    gh.lazySingleton<_i507.IStarChartRepository>(
      () => _i867.StarChartRepositoryImpl(
        apiClient: gh<_i356.RestApiClient>(),
        gqlClient: gh<_i771.GQLClient>(),
      ),
    );
    gh.factory<_i906.GenerateStarChartUseCase>(
      () => _i906.GenerateStarChartUseCase(gh<_i507.IStarChartRepository>()),
    );
    gh.factory<_i557.ConstellationsCubit>(
      () => _i557.ConstellationsCubit(gh<_i906.GenerateStarChartUseCase>()),
    );
    return this;
  }
}
