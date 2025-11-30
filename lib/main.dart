import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'project/presentation/widgets/base_app.dart';

@InjectableInit()
Future<void> configureDependencies(String flavor) async =>
    GetIt.instance;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Keep native splash screen up until app is finished bootstrapping
  if (!kIsWeb) {
    //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  runApp(BaseApp(initialLoad: null, initialRoute: "", initialInput: null));
}
