import 'package:flutter_ui_base/common_libs.dart';
import 'package:flutter_ui_base/presentation/base_pages/page_not_found.dart';
import 'package:base_app/project/data/dependencies/assets.dart';
import 'app_route.dart';
import 'handle_redirect.dart';
import 'package:base_app/features/constellations_sky/presentation/pages/constellations_page.dart';

/// Shared paths / urls used across the app
class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcome';
  static String home = '/home';
  static String constellations = '/constellations';

  /// Dynamically nested pages, always added on to the existing path
  static String video(String id) => _appendToCurrentPath('/video/$id');

  static String _appendToCurrentPath(String newPath) {
    final newPathUri = Uri.parse(newPath);
    final currentUri = appRouter.routeInformationProvider.value.uri;
    Map<String, dynamic> params = Map.of(currentUri.queryParameters);
    params.addAll(newPathUri.queryParameters);
    Uri? loc = Uri(
      path: '${currentUri.path}/${newPathUri.path}'.replaceAll('//', '/'),
      queryParameters: params,
    );
    return loc.toString();
  }
}

/// Routing table, matches string paths to UI Screens, optionally parses params from the paths
final appRouter = GoRouter(
  redirect: handleRedirect,
  errorPageBuilder: (context, state) => MaterialPage(
    child: PageNotFound(
      state.uri.toString(),
      logoPath: ImagePaths.appLogoPlain,
      onHomePressed: () {
        context.go(ScreenPaths.home);
      },
    ),
  ),
  routes: [
    ShellRoute(
      builder: (context, router, navigator) {
        return navigator;
      },
      routes: [
        AppRoute(
          ScreenPaths.splash,
          (_) => Container(color: $styles.colors.greyDark),
        ),
        // This will be hidden
        AppRoute(ScreenPaths.intro, (_) => ConstellationsPage()),
        AppRoute(ScreenPaths.home, (_) => ConstellationsPage(), routes: []),
        AppRoute(ScreenPaths.constellations, (_) => const ConstellationsPage()),
      ],
    ),
  ],
);
