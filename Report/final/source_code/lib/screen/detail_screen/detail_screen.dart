import 'package:cooking/model/recipe_model.dart';
import 'package:cooking/screen/detail_screen/directions_tab.dart';
import 'package:cooking/screen/detail_screen/ingredients_tab.dart';
import 'package:cooking/screen/detail_screen/summary_tab.dart';
import 'package:cooking/store/recipe/recipe_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/custom_button/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final RecipeModel recipe;

  const DetailScreen({Key key, this.recipe}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PageController pageController = PageController();
  int currentPageIndex = 0;
  bool isFavorite = false;
  RecipeStore recipeStore;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.recipe.isFavorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    recipeStore = Provider.of<RecipeStore>(context);
    return Scaffold(
      body: buildContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          currentPageIndex++;
          if (currentPageIndex >= 3) {
            currentPageIndex = 0;
          }
          pageController.animateToPage(currentPageIndex,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn);
        },
        backgroundColor: AppColors.selected,
        child: const Icon(Icons.chevron_right),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: <Widget>[
        buildHeader(),
        // buildItemsBar(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: PageView(
            onPageChanged: (value) {
              // detailScreenStore.checkTabDetail(value);
              //  setState(() {});
            },
            controller: pageController,
            children: <Widget>[
              SummaryTab(
                recipe: widget.recipe,
              ),
              IngredientsTab(
                recipe: widget.recipe,
              ),
              DirectionsTab(
                recipe: widget.recipe,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Render image, back button and favorite button
  Widget buildHeader() {
    return Stack(
      children: <Widget>[
        buildImage(),
        Padding(
          padding: EdgeInsets.only(
              top: Dimens.padding['largePadding'],
              left: Dimens.padding['screenPadding'],
              right: Dimens.padding['screenPadding']),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CookbookBackButton(
                onPressed: () {
                  Get.back();
                },
              ),
              buildFavoriteButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildImage() {
    if (widget.recipe.photo != null) {
      return Image.memory(
        widget.recipe.photo,
        fit: BoxFit.cover,
        width: getScreenWidth(context),
        height: getScreenHeight(context) * 0.3,
      );
    } else {
      return Container(
        width: getScreenWidth(context),
        height: getScreenHeight(context) * 0.35,
        color: AppColors.primary,
      );
    }
  }

  Widget buildFavoriteButton() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isFavorite = !isFavorite;
          });

          recipeStore.addRecipeToFavorite(widget.recipe.id,
              isFavorite: isFavorite);
        },
        child: (isFavorite == false)
            ? Icon(
                Icons.star_border,
                size: Dimens.icons['largestIcon'],
                color: Colors.grey,
              )
            : Icon(
                Icons.star,
                size: Dimens.icons['largestIcon'],
                color: AppColors.red,
              ),
      ),
    );
  }
}
