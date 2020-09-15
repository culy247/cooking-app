import 'package:cooking/generated/l10n.dart';
import 'package:cooking/widget/custom_button/back_button.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CookbookBackButton(
            onPressed: () {
              Get.back();
            },
          ),
          CookBookText(text: S.of(context).intro)
        ],
      ),
    );
  }
}
