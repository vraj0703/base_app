import 'package:flutter_core/core/logic/native_widget_service.dart';
import 'package:get_it/get_it.dart';
import 'package:my_localizations/library.dart';
import 'package:base_app/project/domain/logic/app_logic.dart';

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
}
