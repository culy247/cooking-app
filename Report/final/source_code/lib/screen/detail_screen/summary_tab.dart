import 'package:cooking/generated/l10n.dart';
import 'package:cooking/model/recipe_model.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_items/items_time.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SummaryTab extends StatefulWidget {
  final RecipeModel recipe;

  const SummaryTab({Key key, this.recipe}) : super(key: key);

  @override
  _SummaryTabState createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimens.padding['tinyPadding'],
          bottom: Dimens.padding['screenPadding']),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderText(),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildRecipeName(),
                buildRecipeDescription(),
                buildTime(),
                buildNote(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeaderText() {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimens.padding['screenPadding'],
        right: Dimens.padding['screenPadding'],
        bottom: Dimens.padding['screenPadding'],
      ),
      child: CookBookText(
        text: S.of(context).summary,
        textColor: AppColors.selected,
        textSize: 30,
      ),
    );
  }

  Widget buildRecipeName() {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.padding['screenPadding'],
          right: Dimens.padding['screenPadding']),
      child: Row(
        children: [
          Expanded(
            child: CookBookText(
                text: widget.recipe.name,
                textSize: Dimens.texts['veryLargeText'],
                textColor: AppColors.selected,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildRecipeDescription() {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimens.padding['smallPadding'],
        left: Dimens.padding['screenPadding'],
        bottom: Dimens.padding['screenPadding'],
      ),
      child: Row(
        children: [
          Expanded(
            child: CookBookText(
                text: widget.recipe.description,
                textSize: Dimens.texts['mediumText']),
          ),
        ],
      ),
    );
  }

  Widget buildNote() {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.padding['screenPadding'],
          right: Dimens.padding['screenPadding'],
          bottom: Dimens.padding['screenPadding']),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CookBookText(
            text: S.of(context).note,
            textSize: Dimens.texts['veryLargeText'],
            textColor: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
          Padding(
              padding: EdgeInsets.only(
                top: Dimens.padding['smallPadding'],
                left: Dimens.padding['smallPadding'],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CookBookText(
                        text: widget.recipe.note ?? '',
                        textSize: Dimens.texts['mediumText']),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget buildTime() {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimens.padding['largePadding'],
          bottom: Dimens.padding['largePadding']),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ItemTime(
              text: S.of(context).preparation,
              check: true,
              unit: S.of(context).mins,
              time: '${widget.recipe.preparationTime}'),
          ItemTime(
              text: S.of(context).cooking,
              check: true,
              unit: S.of(context).mins,
              time: '${widget.recipe.preparationTime}'),
        ],
      ),
    );
  }
}
