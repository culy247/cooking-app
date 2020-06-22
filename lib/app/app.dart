import 'package:cooking/generated/l10n.dart';
import 'package:cooking/router/routes.dart';
import 'package:cooking/screen/home/home_screen.dart';
import 'package:cooking/store/test_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/fonts.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  static Router router;

  App({Key key}) : super(key: key) {
    final router = new Router();
    Routes.configureRoutes(router);
    App.router = router;
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
    ));
    return MultiProvider(
      providers: [
        Provider<TestStore>.value(value: TestStore()),
      ],
      child: MaterialApp(
          color: AppColors.primary,
          title: '',
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          localeResolutionCallback:
              (Locale locale, Iterable<Locale> supportedLocales) {
            if (locale == null) {
              debugPrint("*language locale is null!!!");
              return supportedLocales.first;
            }

            for (Locale supportedLocale in supportedLocales) {
              if (locale != null) {
                if (supportedLocale.languageCode == locale.languageCode ||
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
            }
            return supportedLocales.first;
          },
          onGenerateRoute: App.router.generator,
          theme: ThemeData(
              primaryColor: AppColors.primary,
              //          accentColor: AppColors.primary,
              fontFamily: Fonts.robotoRegular,
              cupertinoOverrideTheme: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w300))),
              primaryTextTheme: TextTheme(
                headline6:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              primaryIconTheme: IconThemeData(color: Colors.white)),
          //home: TutorialScreen(),
          home: HomeScreen()),
    );
  }

}
