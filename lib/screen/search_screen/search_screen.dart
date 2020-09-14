import 'package:cooking/navigation/navigation.dart';
import 'package:cooking/screen/detail_screen/detail_screen.dart';
import 'package:cooking/store/recipe/recipe_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/images.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/clipper/app_bar_clipper.dart';
import 'package:cooking/widget/custom_items/item_recipe.dart';
import 'package:cooking/widget/custom_textfield_search/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  RecipeStore recipeStore;

  @override
  Widget build(BuildContext context) {
    recipeStore = Provider.of<RecipeStore>(context);
    return Column(
      children: <Widget>[
        ClipPath(
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
            )),
        Padding(
          padding: const EdgeInsets.all(15),
          child: SearchBox(
            onTextChanged: onSearchTextChanged,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(child: Observer(
          builder: (BuildContext context) {
            return ListView.builder(
              itemCount: recipeStore.searchedRecipes.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    navigateTo(DetailScreen(
                      recipe: recipeStore.searchedRecipes[index],
                    ));
                  },
                  child: ItemRecipe(
                    name: recipeStore.searchedRecipes[index].name,
                    checkFavorite: false,
                    description: recipeStore.searchedRecipes[index].description,
                    onPressed: () {
                      navigateTo(DetailScreen(
                        recipe: recipeStore.searchedRecipes[index],
                      ));
                    },
                    image: recipeStore.searchedRecipes[index].photo,
                  ),
                );
              },
            );
          },
        )),
      ],
    );
  }

  void onSearchTextChanged(String text) {
    recipeStore.searchRecipe(text);
  }
}
