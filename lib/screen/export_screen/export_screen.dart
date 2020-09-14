import 'package:cooking/generated/l10n.dart';
import 'package:cooking/store/export_store/export_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/clipper/app_bar_clipper.dart';
import 'package:cooking/widget/custom_button/back_button.dart';
import 'package:cooking/widget/custom_items/item_export_recipe.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class ExportScreen extends StatefulWidget {
  @override
  _ExportScreenState createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  bool selectAll = false;
  ExportStore exportStore = ExportStore();

  @override
  void initState() {
    super.initState();

    onWidgetBuildDone(onBuildDone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      buildHeader(),
      buildButtonSelectAll(),
      Observer(
        builder: (_) {
          return buildContent();
        },
      ),
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

  Widget buildHeader() {
    return Container(
      color: Colors.transparent,
      child: ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            height: getScreenHeight(context) * 0.2,
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(Dimens.padding['screenPadding']),
                  child: CookbookBackButton(
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
    if (exportStore.recipeList.isEmpty) {
      return Expanded(child: Center(child: buildErrorMessage()));
    }
    return Expanded(
      child: ListView(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: exportStore.recipeList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemExportRecipe(
                index: index,
                name: exportStore.recipeList[index].name,
                description: exportStore.recipeList[index].description,
                image: exportStore.recipeList[index].photo,
                onPressed: onItemPressed,
                isSelected: exportStore.recipeList[index].isSelected,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildErrorMessage() {
    return CookBookText(
      text: S.of(context).msgLoadRecipeError,
      textColor: Colors.deepOrangeAccent,
      textSize: 20,
      textAlign: TextAlign.center,
    );
  }

  Widget buildButtonSelectAll() {
    return Padding(
      padding: EdgeInsets.all(Dimens.padding['screenPadding']),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectAll = !selectAll;
          });
          if (selectAll) {
            exportStore.selectAllRecipes();
          } else {
            exportStore.unselectAllRecipes();
          }
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
                          '${' (${exportStore.recipeList.length})'}',
                      textColor: AppColors.primary,
                      textSize: Dimens.texts['veryLargeText'],
                      fontWeight: FontWeight.bold,
                    )
                  : CookBookText(
                      text: '${S.of(context).unSelectAll}'
                          '${' (${exportStore.recipeList.length})'}',
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

  void onBuildDone() {
    exportStore.getRecipes();
  }

  void onItemPressed(int index, bool currentSelectedState) {
    exportStore.updateRecipeSelectedState(index, !currentSelectedState);
  }
}
