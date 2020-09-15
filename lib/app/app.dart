import 'package:cooking/db/db.dart';
import 'package:cooking/generated/l10n.dart';
import 'package:cooking/repository/category_repository.dart';
import 'package:cooking/repository/recipe_repository.dart';
import 'package:cooking/screen/splash_screen/splash_screen.dart';
import 'package:cooking/store/filter_screen_store/filter_screen_store.dart';
import 'package:cooking/store/recipe/recipe_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/fonts.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);
  static DB db = DB();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FilterScreenStore>.value(
            value: FilterScreenStore(CategoryRepository())),
        Provider<RecipeRepository>.value(value: RecipeRepository()),
        Provider<CategoryRepository>.value(value: CategoryRepository()),
        Provider<RecipeStore>.value(value: RecipeStore())
      ],
      child: GetMaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Get.locale,
        color: AppColors.primary,
        theme: ThemeData(
            primaryColor: AppColors.primary,
            fontFamily: Fonts.quicksand,
            cupertinoOverrideTheme: const CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w300))),
            primaryTextTheme: const TextTheme(
              headline6:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            primaryIconTheme: const IconThemeData(color: Colors.white)),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
  }
}
