import 'package:cooking/generated/l10n.dart';
import 'package:cooking/navigation/navigation.dart';
import 'package:cooking/screen/detail_screen/detail_screen.dart';
import 'package:cooking/store/recipe/recipe_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/images.dart';
import 'package:cooking/utils/logger.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/clipper/app_bar_clipper.dart';
import 'package:cooking/widget/custom_button/back_button.dart';
import 'package:cooking/widget/custom_items/item_recipe.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class FilterResultScreen extends StatefulWidget {
  final int categoryId;
  final String categoryName;

  const FilterResultScreen({Key key, this.categoryId, this.categoryName})
      : super(key: key);

  @override
  _FilterResultScreenState createState() => _FilterResultScreenState();
}

class _FilterResultScreenState extends State<FilterResultScreen> {
  int index = 0;
  RecipeStore recipeStore = RecipeStore();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();

    onWidgetBuildDone(onBuildDone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildContent());
  }

  Widget buildContent() {
    return Column(
      children: <Widget>[
        buildHeader(),
        buildRecipeList(),
      ],
    );
  }

  Widget buildHeader() {
    return ClipPath(
        clipper: AppBarClipper(),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              color: AppColors.primary,
              height: getScreenHeight(context) * 0.2,
              child: Align(
                child: Image(
                    image: const AssetImage(Images.icCarrot),
                    height: getScreenWidth(context) * 0.2,
                    width: getScreenWidth(context) * 0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: CookbookBackButton(
                onPressed: () {
                  Get.back();
                },
              ),
            )
          ],
        ));
  }

  Widget buildRecipeList() {
    return Expanded(child: Observer(
      builder: (BuildContext context) {
        if (recipeStore.filteredRecipes.isEmpty) {
          return Center(
            child: CookBookText(
              text: '${S.of(context).msgNoRecipeIn} ${widget.categoryName}',
              textColor: Colors.red,
              textSize: 20,
              textAlign: TextAlign.center,
            ),
          );
        }

        return ListView.builder(
          itemCount: recipeStore.filteredRecipes.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                navigateTo(DetailScreen(
                  recipe: recipeStore.filteredRecipes[index],
                ));
              },
              child: ItemRecipe(
                name: recipeStore.filteredRecipes[index].name,
                checkFavorite: false,
                description: recipeStore.filteredRecipes[index].description,
                onPressed: () {
                  navigateTo(DetailScreen(
                    recipe: recipeStore.filteredRecipes[index],
                  ));
                },
                image: recipeStore.filteredRecipes[index].photo,
              ),
            );
          },
        );
      },
    ));
  }

  void onBuildDone() {
    recipeStore.getRecipesByCategory(widget.categoryId);
  }
}
