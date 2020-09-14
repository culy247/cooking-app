import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTime extends StatefulWidget {
  const ItemTime({this.time, this.unit, this.text, this.check});

  final String text;
  final String time;
  final String unit;
  final bool check;

  @override
  _ItemTimeState createState() => _ItemTimeState();
}

class _ItemTimeState extends State<ItemTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.width * 0.3,
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.check == true
                  ? AppColors.primary
                  : AppColors.bgGreyAppBar,
              width: 2.7,
            ),
          ),
          child: buildItems(),
        ),
        Padding(
            padding: EdgeInsets.only(top: Dimens.padding['smallPadding']),
            child: CookBookText(
              text: widget.text,
              textSize: Dimens.texts['largeText'],
              textColor: widget.check == true
                  ? AppColors.selected
                  : AppColors.bgGreyAppBar,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }

  Widget buildItems() {
    return (widget.unit == null && widget.time == null)
        ? CookBookText(text: '?', textSize: Dimens.texts['veryLargeText'])
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CookBookText(
                text: widget.time,
                textSize: Dimens.texts['veryLargeText'],
                fontWeight: FontWeight.bold,
                textColor: widget.check == true
                    ? AppColors.selected
                    : AppColors.bgGreyAppBar,
              ),
              CookBookText(
                text: widget.unit,
                textSize: Dimens.texts['veryLargeText'],
                fontWeight: FontWeight.bold,
                textColor: widget.check == true
                    ? AppColors.selected
                    : AppColors.bgGreyAppBar,
              )
            ],
          );
  }
}
