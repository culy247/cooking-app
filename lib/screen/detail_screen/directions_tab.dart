import 'package:cooking/generated/l10n.dart';
import 'package:cooking/model/recipe_model.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_items/items_directions.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';

class DirectionsTab extends StatefulWidget {
  final RecipeModel recipe;

  const DirectionsTab({Key key, this.recipe}) : super(key: key);

  @override
  _DirectionsTabState createState() => _DirectionsTabState();
}

class _DirectionsTabState extends State<DirectionsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.padding['screenPadding']),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderText(),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildDirections(),
                const SizedBox(
                  height: 10,
                ),
                buildNote()
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

  Widget buildDirections() {
    if (widget.recipe.directions != null) {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.recipe.directions.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemsDirection(
              index: index,
              direction: widget.recipe.directions[index],
            );
          });
    } else {
      return Container();
    }
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
              child: CookBookText(
                  text: 'Note', textSize: Dimens.texts['mediumText'])),
        ],
      ),
    );
  }
}
