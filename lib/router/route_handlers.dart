import 'package:cooking/screen/home/home_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var homeScreenHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeScreen();
});
