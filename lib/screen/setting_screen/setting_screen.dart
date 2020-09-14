import 'package:cooking/generated/l10n.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/theme/images.dart';
import 'package:cooking/utils/email_launcher.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/clipper/app_bar_clipper.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

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
            children: <Widget>[buildItemsSetting()],
          ),
        ),
      ),
    ]);
  }

  Widget buildItems({Widget icon, String text, Function onPressed}) {
    return GestureDetector(
      onTap: () {
        onPressed?.call();
      },
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              icon,
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: Dimens.padding['mediumPadding']),
                  child: CookBookText(
                    text: text,
                    textSize: 20,
                    textColor: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Dimens.padding['mediumPadding'],
                bottom: Dimens.padding['mediumPadding']),
            child: Container(color: AppColors.bgGreyAppBar, height: 1.0),
          ),
        ],
      ),
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
          buildItems(
              icon: const Icon(Icons.share),
              text: S.of(context).share,
              onPressed: () {
                Share.share(S.of(context).msgShare,
                    subject: S.of(context).shareSubject);
              }),
          buildItems(
              icon: const Icon(Icons.help),
              text: S.of(context).help,
              onPressed: () {
                sendEmail();
              }),
          buildItems(
              icon: const Icon(Icons.g_translate),
              text: S.of(context).language,
              onPressed: () {}),
          buildItems(
              icon: Image.asset(
                Images.iconCarrotSetting,
                height: 24.0,
                width: 24.0,
              ),
              text: S.of(context).about,
              onPressed: () {})
        ],
      ),
    );
  }
}
