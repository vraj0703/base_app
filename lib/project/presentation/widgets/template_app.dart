import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/core/models/boot_load.dart';

//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_ui_base/domain/logic/app_shortcuts.dart';
import 'package:flutter_ui_base/flutter_ui_base.dart';
import 'package:flutter_ui_base/presentation/widgets/app_scroll_behavior.dart';
import 'package:my_localizations/l10n/app_localizations.dart';
import 'package:base_app/project/data/dependencies/logger.dart';
import 'package:base_app/project/data/models/context_collects.dart';
import 'package:base_app/project/data/routes/router.dart';
import 'package:base_app/project/presentation/states/blocs/app_bloc.dart';
import 'package:sized_context/sized_context.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TemplateApp extends StatelessWidget {
  final String initialRoute;
  final BootLoad? initialLoad;
  final dynamic initialInput;

  const TemplateApp({
    super.key,
    required this.initialRoute,
    this.initialLoad,
    this.initialInput,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        logger.d("initialising app bloc...");
        var bloc = AppBloc();
        bloc.add(AppEvent.configure(initialLoad));
        logger.d("added event 'Configure'");
        return bloc;
      },
      child: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            injectWithContext: () {
              var bloc = BlocProvider.of<AppBloc>(context);
              var mq = MediaQuery.of(context);
              bloc.add(
                AppEvent.configureWithContext(
                  ContextCollects(
                    screenSize: context.sizePx,
                    disableAnimations: mq.disableAnimations,
                    highContrast: mq.highContrast,
                  ),
                ),
              );
            },
            completed: (entity) {
              //FlutterNativeSplash.remove();
            },
            error: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const SizedBox(),
            injectWithContext: () => const SizedBox(),
            completed: (entity) {
              return _App(
                child: MaterialApp.router(
                  routeInformationProvider: appRouter.routeInformationProvider,
                  routeInformationParser: appRouter.routeInformationParser,
                  locale: null,
                  debugShowCheckedModeBanner: false,
                  routerDelegate: appRouter.routerDelegate,
                  shortcuts: AppShortcuts.defaults,
                  theme: $styles.themeData(),
                  color: $styles.colors.black,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.supportedLocales,
                ),
              );
            },
            error: () => const SizedBox(),
          );
        },
      ),
    );
  }
}

class _App extends StatefulWidget {
  final Widget child;

  _App({required this.child});

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: ValueKey($styles.scale),
      child: Theme(
        data: $styles.themeData(),
        // Provide a default texts style to allow Hero's to render text properly
        child: DefaultTextStyle(
          style: $styles.text.bodyMedium,
          // Use a custom scroll behavior across entire app
          child: ScrollConfiguration(
            behavior: AppScrollBehavior(),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
