import 'package:cooking/generated/l10n.dart';
import 'package:cooking/screen/home/home_screen.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
    ));
    return GetMaterialApp(
      home: MaterialApp(
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
          // onGenerateRoute: App.router.generator,
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
