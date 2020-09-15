import 'package:cooking/constants/constants.dart';
import 'package:cooking/generated/l10n.dart';
import 'package:cooking/model/recipe_model.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_items/items_ingredients.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';

class IngredientsTab extends StatefulWidget {
  final RecipeModel recipe;

  const IngredientsTab({Key key, this.recipe}) : super(key: key);

  @override
  _IngredientsTabState createState() => _IngredientsTabState();
}

class _IngredientsTabState extends State<IngredientsTab> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: Dimens.padding['screenPadding']),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeaderText(),
            Expanded(child: buildIngredients()),
          ],
        ));
  }

  Widget buildHeaderText() {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimens.padding['screenPadding'],
        right: Dimens.padding['screenPadding'],
        bottom: Dimens.padding['screenPadding'],
      ),
      child: CookBookText(
        text: S.of(context).ingredients,
        textColor: AppColors.selected,
        textSize: 30,
      ),
    );
  }

  Widget buildIngredients() {
    if (widget.recipe.ingredients != null &&
        widget.recipe.ingredients.isNotEmpty) {
      return ListView.builder(
          itemCount: widget.recipe.ingredients.length,
          itemBuilder: (BuildContext context, int index) {
            final String ingredient = widget.recipe.ingredients[index];
            final List<String> parts =
                ingredient?.split(Constants.AND_SEPARATOR);
            String name;
            String amount;
            if (parts != null && parts.isNotEmpty) {
              name = parts[0];
              if (parts.length > 1) {
                amount = parts?.elementAt(1);
              }
            }
            return IngredientItem(
              index: index + 1,
              name: name,
              amount: amount,
            );
          });
    }

    return Container();
  }
}
