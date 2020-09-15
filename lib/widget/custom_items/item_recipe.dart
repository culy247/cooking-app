import 'dart:typed_data';

import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';

class ItemRecipe extends StatefulWidget {
  const ItemRecipe({
    this.name,
    this.description,
    this.image,
    this.checkFavorite,
    this.showModalBottom,
    this.onPressed,
  });

  final String name;
  final String description;
  final Uint8List image;
  final bool checkFavorite;
  final Function showModalBottom;
  final Function onPressed;

  @override
  _ItemRecipeState createState() => _ItemRecipeState();
}

class _ItemRecipeState extends State<ItemRecipe> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            widget.onPressed?.call();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(Dimens.padding['smallPadding']),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(left: Dimens.padding['tinyPadding']),
                      child: widget.image != null
                          ? ClipOval(
                              child: Image.memory(
                                widget.image,
                                fit: BoxFit.cover,
                                width: getScreenWidth(context) / 4,
                                height: getScreenWidth(context) / 4,
                              ),
                            )
                          : ClipOval(
                              child: Container(
                                color: AppColors.primary,
                                width: getScreenWidth(context) / 4,
                                height: getScreenWidth(context) / 4,
                              ),
                            ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimens.padding['smallPadding']),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: Dimens.padding['smallPadding']),
                                child: CookBookText(
                                    text: widget.name,
                                    textSize: Dimens.texts['veryLargeText'],
                                    textColor: AppColors.primary,
                                    fontWeight: FontWeight.bold)),
                            CookBookText(
                              text: widget.description,
                              textSize: Dimens.texts['mediumText'],
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (widget.checkFavorite)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: Dimens.padding['tinyPadding']),
              child: IconButton(
                icon: const Icon(Icons.star, color: AppColors.selected),
                onPressed: () {
                  if (widget.showModalBottom != null) {
                    widget.showModalBottom();
                  }
                },
              ),
            ),
          )
        else
          Container(),
      ],
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.all(
        Radius.circular(Dimens.radius['radiusBorderDetail']),
      ),
    );
  }
}
