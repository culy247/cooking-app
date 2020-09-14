import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';

class AppBarItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;

  const AppBarItem({Key key, this.text, this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Column(
        children: <Widget>[
          Icon(icon,
              size: Dimens.icons['veryLargestIcon'], color: Colors.white),
          CookBookText(
            text: text,
            textSize: Dimens.texts['mediumText'],
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
