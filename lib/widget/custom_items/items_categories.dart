import 'package:cooking/store/filter_screen_store/filter_screen_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';

class ItemsCategories extends StatefulWidget {
  const ItemsCategories(
      {this.filterScreenStore, this.index, this.onItemPressed});

  final FilterScreenStore filterScreenStore;
  final int index;
  final Function onItemPressed;

  @override
  _ItemsCategoriesState createState() => _ItemsCategoriesState();
}

class _ItemsCategoriesState extends State<ItemsCategories> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          widget.filterScreenStore.checkClick(widget.index);
          widget.onItemPressed?.call(widget.index);
          setState(() {});
        },
        leading: Icon(
          Icons.check,
          color: (widget.filterScreenStore.listDataCategories[widget.index]
                      .isSelected ==
                  true)
              ? AppColors.primary
              : Colors.transparent,
          size: Dimens.icons['largestIcon'],
        ),
        title: CookBookText(
          text: widget.filterScreenStore.listDataCategories[widget.index].name,
          fontWeight: FontWeight.bold,
          textColor: (widget.filterScreenStore.listDataCategories[widget.index]
                      .isSelected ==
                  true)
              ? AppColors.primary
              : Colors.grey,
          textSize: Dimens.texts['veryLargeText'],
        ),
        subtitle: CookBookText(
          text: widget
              .filterScreenStore.listDataCategories[widget.index].description,
          textSize: Dimens.texts['smallText'],
        ));
  }
}
