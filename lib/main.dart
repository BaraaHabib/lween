import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/validation/arabic_validation_overrides.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/env.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/storage/hive/app_storage.dart';
import 'package:lween/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
AppRouter? appRouter;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  initInjection();
  var prefs = await SharedPreferences.getInstance();
  final appTheme = ThemeManager.initTheme(prefs);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: appTheme == ThemeType.light  ? Styles.navbarLightBackgroundColor : Styles.navbarDarkBackgroundColor,
  //   statusBarIconBrightness: appTheme == ThemeType.light ? Brightness.dark :  Brightness.light ,
  // ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // statusBarColor: isLightTheme  ? Styles.navbarLightBackgroundColor : Styles.navbarDarkBackgroundColor,
    statusBarIconBrightness: appTheme == ThemeType.light ? Brightness.dark :  Brightness.light ,
  ));
  await sl<LocaleProvider>().fetchLocale(prefs);
  Environment().initConfig();
  runApp(const Lween());
}

class Lween extends HookWidget {
  const Lween({super.key});

  static AppStateModel get appState => sl<AppStateModel>();

  static Environment get env => Environment();

  static AppStorage get storage => sl<AppStorage>();

  static LocaleProvider get locale =>
      Provider.of<LocaleProvider>(navigatorKey.currentContext!, listen: false);

  static final navigatorKey = GlobalKey<NavigatorState>();

  // final appRouter = AppRouter(navigatorKey);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appRouter ??= AppRouter(navigatorKey);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => sl<AppStateModel>(),
        ),
        ChangeNotifierProvider(
          create: (context) => sl<LocaleProvider>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 750),
        // scaleByHeight: true,
        useInheritedMediaQuery: true,
        builder:(ctx,child) => Consumer2<AppStateModel, LocaleProvider>(
          builder: (context, appState, local, child) {
            return MaterialApp.router(
              title: AppConfigurations.ApplicationName,
              // routerConfig: appRouter.config(),
              scrollBehavior: const ScrollBehaviorModified(),
              routeInformationParser: appRouter!.defaultRouteParser(),
              routerDelegate: appRouter!.delegate(
                navigatorObservers: () => [
                  // NavigationService.navigatorObserver,
                ],
              ),
              theme: appState.currentThemeData,
              localizationsDelegates: const [
                S.delegate,
                GlobalCupertinoLocalizations.delegate,
                ...GlobalMaterialLocalizations.delegates,
                GlobalWidgetsLocalizations.delegate,
                OverrideFormBuilderLocalizationsAr.delegate,
                FormBuilderLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: local.locale,
            );
          }
        ),
      ),
    );
  }
}


///Used to change default scroll physics
class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return const BouncingScrollPhysics();
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
    // return null;
  }
}