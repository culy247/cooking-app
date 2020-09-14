import 'package:cooking/generated/l10n.dart';
import 'package:cooking/navigation/navigation.dart';
import 'package:cooking/screen/add_screen/add_detail.dart';
import 'package:cooking/screen/favorite_screen/favorite_screen.dart';
import 'package:cooking/screen/recipe_screen/recipe_screen.dart';
import 'package:cooking/screen/search_screen/search_screen.dart';
import 'package:cooking/screen/setting_screen/setting_screen.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final tabs = [
    RecipeScreen(),
    Search(),
    FavoriteScreen(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.selected,
        type: BottomNavigationBarType.fixed,
        items: [
          buildBottomNavBarItem(
              S.of(context).recipe,
              Icons.view_quilt,
              currentIndex == 0
                  ? AppColors.selected
                  : AppColors.colorTextGray),
          buildBottomNavBarItem(
              S.of(context).search,
              Icons.search,
              currentIndex == 1
                  ? AppColors.selected
                  : AppColors.colorTextGray),
          buildBottomNavBarItem(
              S.of(context).favorite,
              Icons.star_border,
              currentIndex == 2
                  ? AppColors.selected
                  : AppColors.colorTextGray),
          buildBottomNavBarItem(
              S.of(context).settings,
              Icons.settings,
              currentIndex == 3
                  ? AppColors.selected
                  : AppColors.colorTextGray),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButton: Visibility(
        visible: currentIndex == 0,
        child: FloatingActionButton(
          backgroundColor: AppColors.selected,
          onPressed: () {
            navigateTo(AddDetail());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  /// Create bottom navigation bar item
  BottomNavigationBarItem buildBottomNavBarItem(
      String text, IconData icon, Color color) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: Dimens.icons['mediumIcon']),
      title: CookBookText(
        textColor: color,
        text: text,
        textSize: Dimens.texts['mediumText'],
      ),
    );
  }

  Widget buildBody() {
    return IndexedStack(
      index: currentIndex,
      children: [
        RecipeScreen(),
        Search(),
        FavoriteScreen(),
        Setting(),
      ],
    );
  }
}
