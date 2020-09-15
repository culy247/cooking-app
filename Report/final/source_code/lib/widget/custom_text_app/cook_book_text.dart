import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/theme/fonts.dart';
import 'package:flutter/material.dart';

class CookBookText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final String font;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow textOverflow;
  final FontStyle fontStyle;
  final TextDecoration textDecoration;
  final Color bgColor;
  final double lineSpacing;

  const CookBookText(
      {@required this.text,
        this.textSize,
        this.textColor,
        this.font,
        this.fontStyle,
        this.fontWeight,
        this.textAlign,
        this.bgColor,
        this.maxLines,
        this.lineSpacing,
        this.textDecoration,
        this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',
        overflow: textOverflow,
        textAlign: textAlign,
        maxLines: maxLines,
        style: TextStyle(
            height: lineSpacing,
            decoration: textDecoration,
            backgroundColor: bgColor,
            fontStyle: fontStyle,
            fontSize: textSize ?? Dimens.texts['defaultText'],
            fontFamily: font ?? Fonts.quicksand,
            color: textColor ?? AppColors.bgGreyAppBar,
            fontWeight: fontWeight));
  }
}
