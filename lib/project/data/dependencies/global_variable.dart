import 'package:get_it/get_it.dart';
import 'package:my_localizations/library.dart';
import 'package:base_app/project/domain/logic/app_logic.dart';

MyLocalizations get localeLogic => GetIt.I<MyLocalizations>();

AppLocalizations get $strings => GetIt.I<MyLocalizations>().strings;

AppLogic get appLogic => GetIt.I.get<AppLogic>();
