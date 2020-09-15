import 'package:cooking/generated/l10n.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_dialog/dialog.dart';
import 'package:cooking/widget/custom_items/items_directions.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDirections extends StatefulWidget {
  final Function onSaveButtonPressed;

  const AddDirections({Key key, this.onSaveButtonPressed}) : super(key: key);

  @override
  _AddDirectionsState createState() => _AddDirectionsState();
}

class _AddDirectionsState extends State<AddDirections> {
  int index = 0;
  List<String> directions = [];
  TextEditingController directionsController = TextEditingController();

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
                text: S.of(context).directions,
                textColor: AppColors.selected,
                textSize: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: directions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildDirectionItem(index);
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(Dimens.padding['screenPadding']),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                  onPressed: () {
                    buildCustomDialog(
                        haveLastTextField: false,
                        onAddButtonPressed: addDirection,
                        hintTextFirst: S.of(context).directions,
                        textEditingControllerFirst: directionsController,
                        button: S.of(context).add,
                        title: S.of(context).add,
                        context: context);
                  },
                  backgroundColor: AppColors.selected,
                  child: Icon(
                    Icons.add,
                    size: Dimens.icons['largeIcon'],
                    color: Colors.white,
                  ))),
        ),
        Padding(
          padding: EdgeInsets.all(Dimens.padding['screenPadding']),
          child: Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
                onTap: () {
                  if (directions.isNotEmpty) {
                    widget.onSaveButtonPressed(directions);
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: CookBookText(
                      text: S.of(context).msgPleaseProvideDirections,
                          textColor: Colors.white,
                          textSize: 20,
                    )));
                  }
                  setState(() {});
                },
                child: CookBookText(
                  text: S.of(context).save,
                  textSize: Dimens.texts['largeText'],
                  textColor: AppColors.selected,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ],
    );
  }

  Widget buildDirectionItem(int index) {
    return ItemsDirection(
      direction: directions[index],
      index: index,
    );
  }

  void addDirection(String name, String amount) {
    if (name != null && name.isNotEmpty) {
      directions.add(name);
      Navigator.pop(context);
    }

    setState(() {});
  }
}
