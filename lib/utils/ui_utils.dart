import 'package:cooking/app/app.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// This method is used when we need to call a method after build() function is completed.
void onWidgetBuildDone(Function function) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    function();
  });
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
}

Future navigateTo(BuildContext context, String path,
    {bool clearStack, TransitionType transition, Duration duration}) {
  return App.router.navigateTo(context, path,
      clearStack: clearStack ?? false,
      transition: transition ?? TransitionType.inFromRight,
      transitionDuration: duration ?? Duration(milliseconds: 250)
  );
}
