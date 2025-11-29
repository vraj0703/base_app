import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_localizations/library.dart';
import 'package:my_theme_style/my_theme_style.dart';
import 'package:base_app/project/data/models/context_collects.dart';

import 'logger.dart';

Future<void> loadAppTheme(ContextCollects collects) async {
  await MyThemeStyle.initialize(
    localeLogic: MyLocalizations(),
    screenSize: collects.screenSize,
    disableAnimations: collects.disableAnimations,
    highContrast: collects.highContrast,
    colorsMap: await parseJsonFromPath('assets/style_config/colors.json'),
    colorSchemesMap: await parseJsonFromPath(
      'assets/style_config/colors_schemes.json',
    ),
    cornersMap: await parseJsonFromPath('assets/style_config/corners.json'),
    shadowsMap: await parseJsonFromPath('assets/style_config/shadows.json'),
    insetsMap: await parseJsonFromPath('assets/style_config/insets.json'),
    textStylesMap: await parseJsonFromPath(
      'assets/style_config/text_styles.json',
    ),
    fontsMap: await parseJsonFromPath('assets/style_config/fonts.json'),
    timesMap: await parseJsonFromPath('assets/style_config/times.json'),
    sizesMap: await parseJsonFromPath('assets/style_config/sizes.json'),
  );
}

Future<Map<String, dynamic>> parseJsonFromPath(String path) async {
  try {
    logger.d("parsing json from path $path");
    return json.decode(await rootBundle.loadString(path));
  } on Exception {
    logger.e("failed to parse the json from path $path");
    return {};
  }
}
