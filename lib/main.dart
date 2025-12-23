import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// ignore: depend_on_referenced_packages
import 'package:my_logger_metrics/my_logger_metrics.dart';
// ignore: unused_import
import 'package:my_localizations/my_localizations.dart';

import 'flavor.dart';
import 'project/presentation/widgets/base_app.dart';

import 'main.config.dart';

@InjectableInit()
Future<void> configureDependencies(String flavor) async =>
    GetIt.instance.init(environment: flavor);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Logger
  var config = AppConfig(flavor: flavor, aptabaseAppKey: null);
  MyLoggerMetrics.init(config: config);

  // Initialize DI
  await configureDependencies(flavor.name);

  // Initialize Localizations (if needed, or just pass delegate to BaseApp)
  // BaseApp usually handles the delegates, but we ensure MyLocalizations is ready.

  runApp(BaseApp(initialLoad: null, initialRoute: "/", initialInput: null));
}
