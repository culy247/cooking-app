import 'dart:io';

import 'package:cooking/constants/constants.dart';
import 'package:cooking/db/db.dart';
import 'package:cooking/generated/l10n.dart';
import 'package:cooking/screen/add_screen/add_directions.dart';
import 'package:cooking/screen/add_screen/add_ingredients.dart';
import 'package:cooking/screen/add_screen/add_summary.dart';
import 'package:cooking/store/recipe/recipe_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/utils/image_convert.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/custom_button/back_button.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddDetail extends StatefulWidget {
  @override
  _AddDetailState createState() => _AddDetailState();
}

class _AddDetailState extends State<AddDetail> {
  PageController pageController = PageController();
  List<bool> checkClick = [true, false, false];
  int currentPageIndex = 0;
  bool checkFavorite = false;
  bool checkLongPressImage = false;
  Map<String, dynamic> recipeData = {};

  RecipeStore recipeStore;

  File image;
  bool checkCamera;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    // recipeRepository = Provider.of<RecipeRepository>(context);
    recipeStore = Provider.of<RecipeStore>(context);
    return Scaffold(
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return Column(
      children: <Widget>[
        buildRecipeImage(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: PageView(
            onPageChanged: (value) {
              setState(() {});
            },
            controller: pageController,
            children: <Widget>[
              AddSummary(onNextButtonPressed: updateSummary),
              AddIngredients(onNextButtonPressed: updateIngredient),
              AddDirections(
                onSaveButtonPressed: onSaveButtonPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPageHeader(String text, int index) {
    return GestureDetector(
      onTap: () {
        currentPageIndex = index;
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn);
      },
      child: Container(
          padding: EdgeInsets.only(
              top: Dimens.padding['smallPadding'],
              bottom: Dimens.padding['smallPadding'],
              left: Dimens.padding['smallPadding'],
              right: Dimens.padding['smallPadding']),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(
                Dimens.radius['radiusBorderBack'],
              )),
          child: CookBookText(
              text: text,
              textSize: Dimens.texts['smallText'],
              textColor: Colors.white,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget buildRecipeImage() {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: getScreenHeight(context) * 0.3,
          color: AppColors.bgGreyAppBar,
          child: image == null
              ? GestureDetector(
                  onTap: () {
                    showCategoryList();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add_a_photo,
                        size: Dimens.icons['veryLargestIcon'],
                        color: Colors.white,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: Dimens.padding['screenPadding']),
                          child: CookBookText(
                            text: S.of(context).addPhoto,
                            textSize: Dimens.texts['largeText'],
                            textColor: Colors.white,
                          ))
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    checkLongPressImage = true;
                    setState(() {});
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Image.file(
                        image,
                        fit: BoxFit.cover,
                        width: getScreenWidth(context),
                      ),
                      if (checkLongPressImage == true)
                        GestureDetector(
                          onTap: () {
                            showCategoryList();
                            checkLongPressImage = false;
                            setState(() {});
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.all(Dimens.padding['screenPadding']),
                            child: Container(
                                padding: EdgeInsets.all(
                                    Dimens.padding['tinyPadding']),
                                decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.create,
                                  size: Dimens.icons['largeIcon'],
                                  color: Colors.white,
                                )),
                          ),
                        )
                      else
                        Container(),
                    ],
                  )),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: Dimens.padding['largePadding'],
              left: Dimens.padding['screenPadding'],
              right: Dimens.padding['screenPadding']),
          child: CookbookBackButton(
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ],
    );
  }

  void showCategoryList() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () {
                pickImageFromGallery();
                Navigator.pop(context);
              },
              child: CookBookText(
                text: S.of(context).takeAPhoto,
                textSize: Dimens.texts['veryLargeText'],
                textColor: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                takePhotoFromCamera();
                Navigator.pop(context);
              },
              child: CookBookText(
                text: S.of(context).openCamera,
                textSize: Dimens.texts['veryLargeText'],
                textColor: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: CookBookText(
              text: S.of(context).cancel,
              textSize: Dimens.texts['veryLargeText'],
              textColor: AppColors.primary,
            ),
          ),
        );
      },
    );
  }

  Future takePhotoFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future pickImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  void updateSummary(String name, String description, int prepareTime,
      int cookingTime, String note, int categoryId) {
    recipeData[Constants.RECIPE_NAME] = name;
    recipeData[Constants.DESCRIPTION] = description;
    recipeData[Constants.CATEGORY] = '';
    recipeData[Constants.TIME_COOKING] = cookingTime;
    recipeData[Constants.TIME_PREPARATION] = prepareTime;
    recipeData[Constants.NOTE] = note;
    recipeData[Constants.CATEGORY] = categoryId;

    currentPageIndex++;
    pageController.animateToPage(currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }

  void updateIngredient(List<String> ingredient) {
    var dataTemp = '';
    final StringBuffer stringBuffer = StringBuffer();
    for (var i = 0; i < ingredient.length; i++) {
      //dataTemp = dataTemp + Constants.AND_SEPARATOR + ingredient[i];
      if (i == 0) {
        stringBuffer.write(ingredient[i]);
      } else {
        stringBuffer.write(Constants.AND_SEPARATOR + ingredient[i]);
      }
    }
    dataTemp = stringBuffer.toString();
    recipeData[Constants.INGREDIENTS] = dataTemp;

    currentPageIndex++;
    pageController.animateToPage(currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }

  /// Save recipe to local database, then come back to Recipe list
  Future<void> onSaveButtonPressed(List<String> directions) async {
    var directionTemp = '';
    final StringBuffer stringBuffer = StringBuffer();
    for (var i = 0; i < directions.length; i++) {
      // Each direction step is separated from the other by '&&&'
      if (i == 0) {
        stringBuffer.write(directions[i]);
      } else {
        stringBuffer.write(Constants.AND_SEPARATOR + directions[i]);
      }
    }
    directionTemp = stringBuffer.toString();
    recipeData[Constants.DIRECTIONS] = directionTemp;

    final photo = image != null ? fileToBlob(image) : null;

    final recipe = Recipe(
        id: DateTime.now().millisecondsSinceEpoch,
        name: recipeData[Constants.RECIPE_NAME] as String,
        directions: directionTemp,
        description: recipeData[Constants.DESCRIPTION] as String,
        ingredients: recipeData[Constants.INGREDIENTS] as String,
        categoryId: recipeData[Constants.CATEGORY] as int,
        cookingTime: recipeData[Constants.TIME_COOKING] as int,
        preparationTime: recipeData[Constants.TIME_PREPARATION] as int,
        photo: photo);

    await recipeStore.saveRecipeToDB(recipe);

    // Back to Recipe list and update the list
    Get.back();
  }
}
