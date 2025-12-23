import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/core/models/boot_load.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:base_app/project/data/dependencies/global_variable.dart';
import 'package:base_app/project/data/dependencies/register_singletons.dart';
import 'package:base_app/project/data/models/context_collects.dart';
import 'package:base_app/project/domain/entities/app_entity.dart';
import 'package:my_logger_metrics/logger.dart';

part 'app_event.dart';

part 'app_state.dart';

part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState.initial()) {
    on<Configure>(_configureApp);
    on<ConfigureWithContext>(_configureWithContext);
  }

  FutureOr<void> _configureApp(Configure event, Emitter<AppState> emit) async {
    emit(const AppState.loading());
    try {
      var bootLoad = event.initialLoad ?? await getBootLoad();
      GetIt.I.registerSingleton<BootLoad>(bootLoad);
      registerSingletons();
      emit(AppState.injectWithContext());
    } on Exception catch (e) {
      $logger.e("$e");
      emit(const AppState.error());
      $logger.d("emit state error");
    }
  }

  FutureOr<void> _configureWithContext(
    ConfigureWithContext event,
    Emitter<AppState> emit,
  ) async {
    await appLogic.bootstrap(event.collects);
    emit(AppState.completed(AppEntity(GetIt.I())));
  }

  Future<BootLoad> getBootLoad() async {
    try {
      $logger.d("getting boot load...");
      return BootLoad.sample();
    } on Exception catch (e) {
      $logger.e("error while fetching boot load from native :: $e");
      rethrow;
    }
  }
}
