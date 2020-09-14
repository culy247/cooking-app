import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final int index;
  final String name;
  final String amount;

  const IngredientItem({Key key, this.index, this.name, this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimens.padding['mediumPadding'],
          bottom: Dimens.padding['mediumPadding']),
      child: Row(
        children: <Widget>[
          buildOrder(index),
          const SizedBox(width: 10,),
          buildIngredientInfo(name, amount)
        ],
      ),
    );
  }

  Widget buildOrder(int index) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.selected,
            width: 2,
          ),
        ),
        child: CookBookText(
          text: '$index',
          textColor: AppColors.primary,
          fontWeight: FontWeight.bold,
          textSize: Dimens.texts['veryLargeText'],
        ));
  }

  Widget buildIngredientInfo(String name, String amount) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildIngredientName(name),
          buildIngredientAmount(amount)
        ],
      ),
    );
  }

  Widget buildIngredientName(String name) {
    return CookBookText(
      text: name,
      textColor: AppColors.primary,
      fontWeight: FontWeight.bold,
      textSize: Dimens.texts['veryLargeText'],
    );
  }

  Widget buildIngredientAmount(String amount) {
    return CookBookText(
      text: amount,
      textColor: AppColors.colorTextGray,
      textSize: Dimens.texts['veryLargeText'],
    );
  }
}
