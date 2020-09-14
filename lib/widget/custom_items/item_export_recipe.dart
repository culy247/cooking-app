import 'dart:typed_data';

import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/theme/images.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';

class ItemExportRecipe extends StatelessWidget {
  const ItemExportRecipe({
    this.name,
    this.description,
    this.image,
    this.onPressed,
    this.isSelected = false,
    this.index,
  });

  final String name;
  final String description;
  final Uint8List image;
  final Function onPressed;
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            onPressed?.call(index, isSelected);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(Dimens.padding['mediumPadding']),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(left: Dimens.padding['tinyPadding']),
                      child: image != null
                          ? Image.memory(
                              image,
                              fit: BoxFit.cover,
                              width: getScreenWidth(context) / 4,
                              height: getScreenWidth(context) / 4,
                            )
                          : Image.asset(
                              Images.defaultImage,
                              fit: BoxFit.cover,
                              width: getScreenWidth(context) / 4,
                              height: getScreenWidth(context) / 4,
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
                                    text: name,
                                    textSize: Dimens.texts['veryLargeText'],
                                    textColor: AppColors.primary,
                                    fontWeight: FontWeight.bold)),
                            CookBookText(
                              text: description,
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
        if (isSelected)
          const Padding(
            padding: EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.check_circle,
                color: AppColors.selected,
                size: 35,
              ),
            ),
          )
        else
          const Padding(
            padding: EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.check_circle_outline,
                color: AppColors.colorTextGray,
                size: 35,
              ),
            ),
          )
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
