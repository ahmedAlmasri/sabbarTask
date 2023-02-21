import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sabbar_task/src/di/injection.dart';
import 'package:sabbar_task/src/routes/router.gr.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  final _appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      themeMode: ThemeMode.light,
      routeInformationParser:
          _appRouter.defaultRouteParser(includePrefixMatches: true),
      routerDelegate: _appRouter.delegate(),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}

const ColorScheme shrineColorScheme = ColorScheme(
  primary: Color(0xFF6E25CA),
  secondary: Color(0xFF6E25CA),
  surface: Color(0xFFFCFCFD),
  background: Color(0xFFFCFCFD),
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Color(0xffffffff),
  onSurface: Colors.black,
  onBackground: Color(0xFFF2F4F7),
  onError: Colors.white,
  brightness: Brightness.light,
);
