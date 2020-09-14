import 'package:cooking/generated/l10n.dart';
import 'package:cooking/model/recipe_model.dart';
import 'package:cooking/navigation/navigation.dart';
import 'package:cooking/screen/detail_screen/detail_screen.dart';
import 'package:cooking/screen/export_screen/export_screen.dart';
import 'package:cooking/screen/filter_screen/select_category_screen.dart';
import 'package:cooking/store/recipe/recipe_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/theme/images.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/clipper/app_bar_clipper.dart';
import 'package:cooking/widget/custom_items/item_recipe.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:cooking/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart' as getx;
import 'package:provider/provider.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  RecipeStore recipeStore;

  @override
  void initState() {
    super.initState();

    onWidgetBuildDone(onBuildDone);
  }

  @override
  Widget build(BuildContext context) {
    recipeStore = Provider.of<RecipeStore>(context);
    return Stack(children: <Widget>[buildContent(), buildAppBar()]);
  }

  Widget buildContent() {
    return Observer(
      builder: (_) {
        if (recipeStore.isLoading) {
          return const Center(
            child: Loader(),
          );
        }
        if (recipeStore.recipeList.isNotEmpty) {
          return buildRecipesList(recipeStore.recipeList);
        } else {
          return Center(child: buildErrorMessage());
        }
      },
    );
  }

  Widget buildRecipesList(List<RecipeModel> recipes) {
    return ListView(
      children: <Widget>[
        Container(
          height: getScreenHeight(context) * 0.2,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemRecipe(
                name: recipes[index].name,
                checkFavorite: false,
                description: recipes[index].description,
                onPressed: () {
                  navigateTo(DetailScreen(
                    recipe: recipes[index],
                  ));
                },
                image: recipes[index].photo);
          },
        ),
      ],
    );
  }

  Widget buildNoRecipeMessage() {
    return CookBookText(
      text: S.of(context).msgNoRecipe,
      textColor: Colors.red,
      textSize: 20,
      textAlign: TextAlign.center,
    );
  }

  Widget buildErrorMessage() {
    return CookBookText(
      text: S.of(context).msgLoadRecipeError,
      textColor: Colors.deepOrangeAccent,
      textSize: 20,
      textAlign: TextAlign.center,
    );
  }

  Widget buildAppBar() {
    return Container(
      color: Colors.transparent,
      child: ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            height: getScreenHeight(context) * 0.2,
            color: AppColors.primary,
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimens.padding['screenPadding'],
                  right: Dimens.padding['screenPadding']),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(
                    image: const AssetImage(Images.icCarrot),
                    height: getScreenWidth(context) / 6,
                    width: getScreenWidth(context) / 6,
                  ),
                  buildAppBarIcon(S.of(context).import, Icons.label_important,
                      onPressed: buildDialog),
                  buildAppBarIcon(S.of(context).export, Icons.import_export,
                      onPressed: () {
                    navigateTo(ExportScreen(),
                        transition: getx.Transition.downToUp);
                  }),
                  buildAppBarIcon(S.of(context).filter, Icons.filter_list,
                      onPressed: () {
                    navigateTo(SelectCategoryScreen(),
                        transition: getx.Transition.downToUp);
                  })
                ],
              ),
            ),
          )),
    );
  }

  Widget buildAppBarIcon(String text, IconData icon, {Function onPressed}) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: getScreenWidth(context) / 10, color: Colors.white),
          CookBookText(
            text: text,
            textSize: Dimens.texts['mediumText'],
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  void buildDialog() {
    final dialog = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(Dimens.radius['radiusBorderTextField']))),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CookBookText(
            text: S.of(context).questDialog,
            textColor: Colors.black,
            textSize: Dimens.texts['largeText'],
            fontWeight: FontWeight.bold,
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimens.padding['mediumPadding']),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: Dimens.padding['mediumPadding']),
                    child: CookBookText(
                      text: S.of(context).noDialog,
                      textColor: Colors.black,
                      textSize: Dimens.texts['largeText'],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      right: Dimens.padding['mediumPadding'],
                    ),
                    child: CookBookText(
                      text: S.of(context).ok,
                      textColor: Colors.black,
                      textSize: Dimens.texts['largeText'],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    showDialog(context: context, child: dialog);
  }

  void onBuildDone() {
    recipeStore.getRecipes();
  }
}
