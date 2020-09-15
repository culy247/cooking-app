import 'package:cooking/db/db.dart';
import 'package:cooking/generated/l10n.dart';
import 'package:cooking/repository/category_repository.dart';
import 'package:cooking/store/filter_screen_store/filter_screen_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/widget/custom_dialog/dialog.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:cooking/widget/loading_container/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ManageCategory extends StatefulWidget {
  @override
  _ManageCategoryState createState() => _ManageCategoryState();
}

class _ManageCategoryState extends State<ManageCategory> {
  CategoryRepository categoryRepository;
  FilterScreenStore filterScreenStore;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameEditController = TextEditingController();
  TextEditingController descriptionEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    filterScreenStore = Provider.of<FilterScreenStore>(context);
    return Scaffold(
      body: Observer(
        builder: (_) {
          return LoadingContainer(
            isLoading: filterScreenStore.isShowLoading,
            child: buildContent(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.selected,
        onPressed: () {
          buildCustomDialog(
              title: S
                  .of(context)
                  .addAnIngredients,
              haveLastTextField: true,
              context: context,
              textEditingControllerFirst: nameController,
              textEditingControllerLast: descriptionController,
              button: S
                  .of(context)
                  .add,
              hintTextFirst: S
                  .of(context)
                  .categoryName,
              hintTextLast: S
                  .of(context)
                  .categoryDescription,
              onAddButtonPressed: () {
                addCategory(nameController, descriptionController);
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimens.padding['largePadding'],
          left: Dimens.padding['screenPadding'],
          right: Dimens.padding['screenPadding']),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              CookBookText(
                text: S
                    .of(context)
                    .categories,
                textColor: AppColors.selected,
                textSize: Dimens.texts['veryLargeText'],
                fontWeight: FontWeight.bold,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filterScreenStore.listDataCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        buildCustomDialog(
                            title: S
                                .of(context)
                                .addAnIngredients,
                            haveLastTextField: true,
                            context: context,
                            button: S
                                .of(context)
                                .save,
                            textEditingControllerFirst: nameEditController,
                            textEditingControllerLast:
                            descriptionEditController,
                            hintTextFirst: filterScreenStore
                                .listDataCategories[index].name,
                            hintTextLast: filterScreenStore
                                .listDataCategories[index].description,
                            onAddButtonPressed: () {
                              if (nameEditController.text != '' &&
                                  descriptionEditController.text != '') {
                                filterScreenStore.listDataCategories[index]
                                    .name = nameEditController.text;
                                filterScreenStore
                                    .listDataCategories[index].description =
                                    descriptionEditController.text;
                                filterScreenStore.updateCategory(Category(
                                    id: filterScreenStore
                                        .listDataCategories[index].id,
                                    name: filterScreenStore
                                        .listDataCategories[index].name,
                                    description: filterScreenStore
                                        .listDataCategories[index]
                                        .description));
                              }
                              setState(() {});
                              Navigator.pop(context);
                            });
                      },
                      title: CookBookText(
                        text: filterScreenStore.listDataCategories[index].name,
                        textSize: Dimens.texts['veryLargeText'],
                        fontWeight: FontWeight.bold,
                        textColor: Colors.black87,
                      ),
                      subtitle: CookBookText(
                        text: filterScreenStore
                            .listDataCategories[index].description,
                        textSize: Dimens.texts['smallText'],
                      ),
                      trailing: const Icon(Icons.navigate_next),
                    );
                  },
                ),
              ),
            ],
          ),
          BackButton(
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }

  void addCategory(TextEditingController dataName,
      TextEditingController dataDescription) {
    categoryRepository.createCategory(Category(
        id: filterScreenStore
            .listDataCategories[
        filterScreenStore.listDataCategories.length - 1]
            .id +
            1,
        name: dataName.text,
        description: dataDescription.text));

    // filterScreenStore.listDataCategories.add(DataCategories(
    //     name: dataName.text,
    //     description: dataDescription.text,
    //     isSelected: false));
    Navigator.pop(context);
  }
}
