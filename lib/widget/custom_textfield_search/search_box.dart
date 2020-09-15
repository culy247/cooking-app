import 'package:cooking/generated/l10n.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final Function onTextChanged;

  const SearchBox({Key key, this.onTextChanged}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimens.padding['mediumPadding'],
          right: Dimens.padding['smallPadding']),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.radius['radiusBorderSearch']),
              topRight: Radius.circular(Dimens.radius['radiusBorderSearch']),
              bottomLeft: Radius.circular(Dimens.radius['radiusBorderSearch']),
              bottomRight:
                  Radius.circular(Dimens.radius['radiusBorderSearch'])),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ]),
      child: TextFormField(
        onChanged: (text) {
          widget.onTextChanged?.call(text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          suffixIcon: const Icon(
            Icons.search,
            color: AppColors.selected,
          ),
          hintText: S.of(context).search,
          hintStyle: TextStyle(
              color: AppColors.selected,
              fontSize: Dimens.texts['largeText']),
        ),
      ),
    );
  }
}
