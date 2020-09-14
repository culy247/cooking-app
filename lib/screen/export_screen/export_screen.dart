import 'package:cooking/generated/l10n.dart';
import 'package:cooking/navigation/navigation.dart';
import 'package:cooking/screen/detail_screen/detail_screen.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/clipper/app_bar_clipper.dart';
import 'package:cooking/widget/contents.dart';
import 'package:cooking/widget/custom_items/item_recipe.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExportScreen extends StatefulWidget {
  @override
  _ExportScreenState createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  bool selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      buildBGTop(),
      //SearchBox(),
      buildButtonSelectAll(),
      buildContent(),
      buildButtonBottom()
    ]));
  }

  Widget customItemActionAppBar(String text, IconData icon) {
    return Column(
      children: <Widget>[
        Icon(icon, size: Dimens.icons['veryLargestIcon'], color: Colors.white),
        CookBookText(
          text: text,
          textSize: Dimens.texts['mediumText'],
          textColor: Colors.white,
        ),
      ],
    );
  }

  Widget buildBGTop() {
    return Container(
      color: Colors.transparent,
      child: ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            height: getScreenWidth(context) * 0.45,
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(Dimens.padding['screenPadding']),
                  child: BackButton(
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: Dimens.padding['tinyPadding'],
                        left: Dimens.padding['screenPadding'],
                        right: Dimens.padding['screenPadding']),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.import_export,
                          color: AppColors.selected,
                          size: Dimens.icons['setting'],
                        ),
                      ],
                    )),
              ],
            ),
          )),
    );
  }

  Widget buildContent() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: contents.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  navigateTo(DetailScreen());
                },
                child: ItemRecipe(
                  // recipe: contents[index],
                  // nameCook: contents[index].name,
                  // checkFavorite: false,
                  // description: contents[index].content,
                  // image: contents[index],
                  // checkIconChoose: selectAll,
                  // checkShowIconChoose: true,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildButtonSelectAll() {
    return Padding(
      padding: EdgeInsets.all(Dimens.padding['screenPadding']),
      child: GestureDetector(
        onTap: () {
          selectAll = !selectAll;
          setState(() {});
        },
        child: Row(
          children: [
            if (selectAll)
              const Icon(
                Icons.check_circle,
                color: AppColors.primary,
              )
            else
              const Icon(
                Icons.check_circle_outline,
                color: AppColors.primary,
              ),
            Padding(
              padding: EdgeInsets.only(left: Dimens.padding['tinyPadding']),
              child: selectAll
                  ? CookBookText(
                      text: '${S.of(context).selectAll}'
                          '${' (${contents.length})'}',
                      textColor: AppColors.primary,
                      textSize: Dimens.texts['veryLargeText'],
                      fontWeight: FontWeight.bold,
                    )
                  : CookBookText(
                      text: '${S.of(context).unSelectAll}'
                          '${' (${contents.length})'}',
                      textSize: Dimens.texts['veryLargeText'],
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButtonBottom() {
    return Container(
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(Dimens.padding['mediumPadding']),
            child: CookBookText(
              text: S.of(context).exportToJson,
              textColor: Colors.white,
              textSize: Dimens.texts['veryLargeText'],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
