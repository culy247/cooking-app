import 'package:cooking/constants/constants.dart';
import 'package:cooking/generated/l10n.dart';
import 'package:cooking/model/ingredient_model.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_dialog/dialog.dart';
import 'package:cooking/widget/custom_items/items_ingredients.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddIngredients extends StatefulWidget {
  final Function onNextButtonPressed;

  const AddIngredients({Key key, this.onNextButtonPressed}) : super(key: key);

  @override
  _AddIngredientsState createState() => _AddIngredientsState();
}

class _AddIngredientsState extends State<AddIngredients> {
  int index = 0;
  List<IngredientModel> ingredients = [];
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController amountEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: Dimens.padding['screenPadding'],
            right: Dimens.padding['screenPadding'],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CookBookText(
                text: S.of(context).ingredients,
                textColor: AppColors.selected,
                textSize: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: buildIngredientList()),
            ],
          ),
        ),
        buildIconAdd(),
        buildButtonNext(),
      ],
    );
  }

  Widget buildItemInfo(int index) {
    return IngredientItem(
      index: index + 1,
      name: ingredients[index].name,
      amount: ingredients[index].amount,
    );
  }

  Widget buildIconAdd() {
    return Padding(
      padding: EdgeInsets.all(Dimens.padding['screenPadding']),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
            backgroundColor: AppColors.selected,
            onPressed: () {
              buildCustomDialog(
                  haveLastTextField: true,
                  context: context,
                  button: S.of(context).add,
                  onAddButtonPressed: addIngredient,
                  title: S.of(context).addAnIngredients,
                  hintTextFirst: S.of(context).ingredientName,
                  textEditingControllerFirst: nameEditingController,
                  textEditingControllerLast: amountEditingController,
                  hintTextLast: S.of(context).ingredientAmount);
            },
            child: Icon(
              Icons.add,
              size: Dimens.icons['largeIcon'],
              color: Colors.white,
            )),
      ),
    );
  }

  Widget buildButtonNext() {
    return Padding(
      padding: EdgeInsets.all(Dimens.padding['screenPadding']),
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
            onTap: () {
              if (ingredients.isNotEmpty) {
                final dataTemp = <String>[];
                for (var i = 0; i < ingredients.length; i++) {
                  dataTemp
                      .add('${ingredients[i].name}${Constants.ADD_SEPARATOR}'
                          '${ingredients[i].amount}');
                }

                widget.onNextButtonPressed(dataTemp);
              } else {
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: CookBookText(
                  text: S.of(context).msgPleaseProvideIngredients,
                  textColor: Colors.white,
                  textSize: 20,
                )));
              }
            },
            child: CookBookText(
              text: S.of(context).next,
              textColor: AppColors.selected,
              textSize: Dimens.texts['veryLargeText'],
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  Widget buildIngredientList() {
    return ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (BuildContext context, int index) {
          return buildItemInfo(index);
        });
  }

  void addIngredient(String name, String amount) {
    if (name != null &&
        amount != null &&
        name.isNotEmpty &&
        amount.isNotEmpty) {
      ingredients.add(IngredientModel(name: name, amount: amount));
      Navigator.pop(context);
    }
    setState(() {});
  }
}
