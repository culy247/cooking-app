import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';

void buildCustomDialog(
    {BuildContext context,
    bool haveLastTextField,
    String title,
    TextEditingController textEditingControllerFirst,
    TextEditingController textEditingControllerLast,
    String hintTextFirst,
    String hintTextLast,
    Function onAddButtonPressed,
    String button,
    int index}) {
  final dialog = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(Dimens.radius['radiusBorderTextField']))),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildTitle(title),
        buildTextField(context, hintTextFirst, textEditingControllerFirst),
        if (haveLastTextField == true)
          buildTextField(context, hintTextLast, textEditingControllerLast)
        else
          Container(),
        buildButton(
            context: context,
            textEditingControllerName: textEditingControllerFirst,
            textEditingControllerAmount: textEditingControllerLast,
            func: onAddButtonPressed,
            button: button,
            check: haveLastTextField),
      ],
    ),
  );
  showDialog(context: context, child: dialog);
}

Widget buildButton(
    {BuildContext context,
      TextEditingController textEditingControllerName,
      TextEditingController textEditingControllerAmount,
      Function func,
      String button,
      bool check}) {
  return Align(
    alignment: Alignment.bottomRight,
    child: GestureDetector(
        onTap: () {
          final String name = textEditingControllerName.text;
          final String amount = textEditingControllerAmount?.text ?? '';
          func?.call(name, amount);
        },
        child: Padding(
          padding: EdgeInsets.only(top: Dimens.padding['screenPadding']),
          child: CookBookText(
            text: button,
            textSize: Dimens.texts['largeText'],
            textColor: AppColors.selected,
            fontWeight: FontWeight.bold,
          ),
        )),
  );
}

Widget buildTextField(BuildContext context, String hintText,
    TextEditingController textEditingController) {
  return TextField(
    controller: textEditingController,
    onChanged: (nameEdit) {},
    decoration: InputDecoration(
      hintText: hintText,
    ),
  );
}

Widget buildTitle(String title) {
  return CookBookText(
    text: title,
    textSize: Dimens.texts['largeText'],
    textColor: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
}
