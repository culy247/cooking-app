import 'package:cooking/generated/l10n.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/theme/images.dart';
import 'package:cooking/utils/logger.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/clipper/app_bar_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      buildTopBar(),
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(Dimens.padding['screenPadding']),
          child: ListView(
            children: <Widget>[buildItemsSetting(), buildLogOut()],
          ),
        ),
      ),
    ]);
  }

  Widget buildItems(Widget icon, String text, {bool check, bool switchValue}) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                icon,
                Padding(
                  padding:
                      EdgeInsets.only(left: Dimens.padding['mediumPadding']),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: Dimens.texts['largeText']),
                  ),
                ),
              ],
            ),
            if (check)
              FlutterSwitch(
                height: 20.0,
                width: 40.0,
                toggleSize: 15.0,
                borderRadius: 10.0,
                inactiveColor: AppColors.bgGreyAppBar,
                activeColor: AppColors.primary,
                value: switchValue,
                onToggle: (value) {
                  AppLogger.instance.d(value);
                  if (!value) {
                    S.delegate.load(const Locale('vi', 'VN'));
                    setState(() {

                    });
                  } else {
                    S.delegate.load(const Locale('en', 'US'));
                    setState(() {

                    });
                  }
                  // setState(() {
                  //   switchValue = value;
                  // });
                },
              )
            else
              Container(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: Dimens.padding['mediumPadding'],
              bottom: Dimens.padding['mediumPadding']),
          child: Container(color: AppColors.bgGreyAppBar, height: 1.0),
        ),
      ],
    );
  }

  Widget buildTopBar() {
    return Container(
      color: Colors.transparent,
      child: ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            height: getScreenHeight(context) * 0.2,
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Padding(
                padding: EdgeInsets.only(
                    top: Dimens.padding['large'],
                    left: Dimens.padding['screenPadding'],
                    right: Dimens.padding['screenPadding']),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      color: AppColors.selected,
                      size: Dimens.icons['setting'],
                    ),
                  ],
                )),
          )),
    );
  }

  Widget buildItemsSetting() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(Dimens.radius['radiusBorderBack'])),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: -1,
            blurRadius: 6,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(Dimens.padding['screenPadding']),
      child: Column(
        children: <Widget>[
          buildItems(const Icon(Icons.person_add), S.of(context).invite,
              check: false, switchValue: false),
          buildItems(
              const Icon(Icons.notifications), S.of(context).notification,
              check: true, switchValue: true),
          buildItems(const Icon(Icons.help), S.of(context).help,
              check: false, switchValue: false),
          buildItems(
              Image.asset(
                Images.iconCarrotSetting,
                height: 24.0,
                width: 24.0,
              ),
              S.of(context).about,
              check: false,
              switchValue: false),
          buildItems(const Icon(Icons.g_translate), S.of(context).language,
              check: false, switchValue: false),
        ],
      ),
    );
  }

  Widget buildLogOut() {
    return Padding(
      padding: EdgeInsets.only(top: Dimens.padding['largestPadding']),
      child: Container(
        padding: EdgeInsets.only(
          top: Dimens.padding['smallPadding'],
          bottom: Dimens.padding['smallPadding'],
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: -1,
                blurRadius: 6,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: AppColors.primary,
            borderRadius: BorderRadius.all(
                Radius.circular(Dimens.radius['radiusBorderBack']))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).logOut,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimens.texts['largeText'],
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
