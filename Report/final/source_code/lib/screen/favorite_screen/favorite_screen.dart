import 'package:cooking/generated/l10n.dart';
import 'package:cooking/navigation/navigation.dart';
import 'package:cooking/screen/detail_screen/detail_screen.dart';
import 'package:cooking/store/recipe/recipe_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/images.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/clipper/app_bar_clipper.dart';
import 'package:cooking/widget/custom_items/item_recipe.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:cooking/widget/custom_textfield_search/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final searchEditingController = TextEditingController();
  String dataTextSearch = '';
  int index = 0;
  RecipeStore recipeStore;

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
    recipeStore = Provider.of<RecipeStore>(context);
    return buildContent();
  }

  Widget buildContent() {
    return Column(
      children: <Widget>[
        buildHeader(),
        // buildSearchBox(),
        buildRecipeList(),
      ],
    );
  }

  Widget buildHeader() {
    return ClipPath(
        clipper: AppBarClipper(),
        child: Container(
          alignment: Alignment.bottomCenter,
          color: AppColors.primary,
          height: getScreenHeight(context) * 0.2,
          child: Align(
            child: Image(
                image: const AssetImage(Images.icCarrot),
                height: getScreenWidth(context) * 0.2,
                width: getScreenWidth(context) * 0.2),
          ),
        ));
  }

  Widget buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SearchBox(
        onTextChanged: onSearchTextChanged,
      ),
    );
  }

  Widget buildRecipeList() {
    return Expanded(child: Observer(
      builder: (BuildContext context) {
        if (recipeStore.favoriteRecipes.isEmpty) {
          return Center(
            child: CookBookText(
              text: S.of(context).msgNoRecipe,
              textColor: Colors.red,
              textSize: 20,
              textAlign: TextAlign.center,
            ),
          );
        }

        return ListView.builder(
          itemCount: recipeStore.favoriteRecipes.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                navigateTo(DetailScreen(
                  recipe: recipeStore.favoriteRecipes[index],
                ));
              },
              child: ItemRecipe(
                name: recipeStore.favoriteRecipes[index].name,
                checkFavorite: false,
                description: recipeStore.favoriteRecipes[index].description,
                onPressed: () {
                  navigateTo(DetailScreen(
                    recipe: recipeStore.favoriteRecipes[index],
                  ));
                },
                image: recipeStore.favoriteRecipes[index].photo,
              ),
            );
          },
        );
      },
    ));
  }

  void onSearchTextChanged(String text) {
    recipeStore.searchRecipe(text, isFavorite: true);
  }

  void onBuildDone() {
    recipeStore.getFavoriteRecipes();
  }
}
