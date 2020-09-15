import 'package:cooking/generated/l10n.dart';
import 'package:cooking/theme/colors.dart';
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CookbookBackButton(
                  onPressed: () {
                    Get.back();
                  },
                ),
                const CookBookText(
                  text: 'Cookbook',
                  textColor: Colors.black,
                  textSize: 30,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CookBookText(
              text: S.of(context).intro,
              textColor: AppColors.primary,
              textSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
