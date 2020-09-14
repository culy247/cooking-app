import 'package:cooking/theme/dimens.dart';
import 'package:flutter/material.dart';

class CookbookBackButton extends StatelessWidget {
  final Function onPressed;

  const CookbookBackButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed?.call();
      },
      child: Container(
          padding: EdgeInsets.all(Dimens.padding['tinyPadding']),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: -2,
                  blurRadius: 8,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(Dimens.radius['radiusBorderBack'])),
          child: Icon(
            Icons.keyboard_backspace,
            size: Dimens.icons['largeIcon'],
            color: Colors.black,
          )),
    );
  }
}
