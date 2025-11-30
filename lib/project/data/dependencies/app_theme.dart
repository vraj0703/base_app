import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_theme_style/my_theme_style.dart';
import 'package:base_app/project/data/models/context_collects.dart';

import 'logger.dart';

Future<void> loadAppTheme(ContextCollects collects, String localeName) async {
  await MyThemeStyle.initialize(
    localeName: localeName,
    screenSize: collects.screenSize,
    disableAnimations: collects.disableAnimations,
    highContrast: collects.highContrast,
    colorsMap: await parseJsonFromPath('app_colors.json'),
    gradientsMap: await parseJsonFromPath('gradients.json'),
    cornersMap: await parseJsonFromPath('corners.json'),
    shadowsMap: await parseJsonFromPath('shadows.json'),
    insetsMap: await parseJsonFromPath('insets.json'),
    textStylesMap: await parseJsonFromPath('text_styles.json'),
    fontsMap: await parseJsonFromPath('fonts.json'),
    timesMap: await parseJsonFromPath('durations.json'),
    sizesMap: await parseJsonFromPath('sizes.json'),
  );
}

Future<Map<String, dynamic>> parseJsonFromPath(String path) async {
  try {
    logger.d("parsing json from path $path");
    return json.decode(await rootBundle.loadString("assets/jsons/$path"));
  } on Exception {
    logger.e("failed to parse the json from path $path");
    return {};
  }
}
