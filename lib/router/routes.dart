import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'route_handlers.dart';

class Routes {
  static String root = '/';
  static String loginScreen = '/LoginScreen';
  static String homeScreen = '/MainScreen';
  static String yourLogBookCalendarScreen = '/YourLogBookCalendarScreen';
  static String settingScreen = '/SettingScreen';
  static String photoAndVideoScreen = '/photoAndVideoScreen';
  static String yourLogBookDetailScreen = '/yourLogBookDetailScreen';
  static String mainSettingScreen = '/MainSettingScreen';
  static String controllerSettingScreen = '/ControllerSettingScreen';
  static String navigationSettingScreen = '/NavigationSettingScreen';
  static String cameraSettingScreen = '/CameraSettingScreen';
  static String selectCountryScreen = '/selectCountryScreen';
  static String cameraRollScreen = '/cameraRollScreen';
  static String dashBoardScreen = '/dashBoard';
  static String yourLogBookScreen = '/yourLogBookScreen';
  static String userProfileScreen = '/userProfileScreen';
  static String chooseLocationScreen = '/ChooseLocationScreen';
  static String mapScreen = '/MapScreen';
  static String journeySummaryPhotosScreen = '/journeySummaryPhotosScreen';
  static String journeySummaryScreen = '/journeySummaryScreen';
  static String sharePhotoScreen = '/SharePhotoScreen';
  static String signUpScreen = '/signUpScreen';
  static String forgotPwScreen = '/forgotPwScreen';
  static String setupScreen = '/setupScreen';
  static String deviceParingScreen = '/deviceParingScreen';
  static String bluetoothParingScreen = '/bluetoothParingScreen';
  static String wifiParingScreen = '/wifiParingScreen';
  static String socialMediaScreen = '/SocialMediaScreen';
  static String argonController = '/argonController';
  static String webViewScreen = '/ArgonWebViewScreen';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print(
          '------> ROUTE WAS NOT FOUND !!! Go to routes.dart and route_handlers.dart and add your screen there <-------');
    });
    router.define(homeScreen, handler: homeScreenHandler);
  }
}
