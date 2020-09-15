import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';

class ItemsDirection extends StatefulWidget {
  const ItemsDirection({this.direction, this.index});

  final String direction;
  final int index;

  @override
  _ItemsDirectionState createState() => _ItemsDirectionState();
}

class _ItemsDirectionState extends State<ItemsDirection> {
  @override
  Widget build(BuildContext context) {
    return buildItemInfo(widget.index);
  }

  Widget buildItemInfo(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(
            Icons.spellcheck,
            color: AppColors.selected,
            size: Dimens.icons['largeIcon'],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: CookBookText(
              text: widget.direction,
              textColor: AppColors.primary,
              textSize: Dimens.texts['veryLargeText'],
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
