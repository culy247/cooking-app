import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Navigate to next screen.
///
/// [screen] Target screen.
///
/// [transition] Transition effect.
///
/// [clearStack] If provided (= true), go to next screen and clear all previous
/// screens.
///
/// [offCurrentScreen] If provided (= true), go to next screen and can not go
/// back to current screen.
///
Future navigateTo(Widget screen,
    {Transition transition,
    bool clearStack,
    bool offCurrentScreen,
    Duration duration}) async {
  var data;
  final t = transition ?? Transition.rightToLeftWithFade;
  final d = duration ?? Duration(milliseconds: 250);
  if (clearStack) {
    data = await Get.offAll(screen, transition: t, duration: d);
  } else if (offCurrentScreen) {
    data = await Get.off(screen, transition: t, duration: d);
  } else {
    data = await Get.to(screen, transition: t, duration: d);
  }

  return data;
}
