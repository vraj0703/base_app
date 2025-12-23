import 'package:flutter_ui_base/common_libs.dart';
import 'package:flutter_ui_base/presentation/base_pages/page_not_found.dart';
import 'package:base_app/project/data/dependencies/assets.dart';
import 'handle_redirect.dart';
import 'package:base_app/features/landing/presentation/pages/landing_page_view.dart';
import 'package:base_app/features/portfolio/presentation/pages/portfolio_page.dart';
import 'package:base_app/features/portfolio/presentation/pages/project_detail_page.dart';

/// Shared paths / urls used across the app
class ScreenPaths {
  static String splash = '/';
  static String home = '/home';
  static String portfolio = '/portfolio';

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
      onHomePressed: () => context.go(ScreenPaths.home),
    ),
  ),
  routes: [
    GoRoute(
      path: ScreenPaths.splash,
      builder: (context, state) => const LandingPageView(),
    ),
    GoRoute(path: ScreenPaths.home, redirect: (_, __) => ScreenPaths.splash),
    GoRoute(
      path: ScreenPaths.portfolio,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const PortfolioPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position:
                Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                ),
            child: child,
          );
        },
      ),
      routes: [
        GoRoute(
          path: 'project/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            return ProjectDetailPage(projectId: id);
          },
        ),
      ],
    ),
  ],
);
