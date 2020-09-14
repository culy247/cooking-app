import 'package:cooking/db/db.dart';
import 'package:cooking/model/filter_model.dart';
import 'package:cooking/repository/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'filter_screen_store.g.dart';

class FilterScreenStore = _FilterScreenStore with _$FilterScreenStore;

abstract class _FilterScreenStore with Store {
  final CategoryRepository categoryRepository;

  @observable
  ObservableList<DataCategories> listDataCategories =
      ObservableList<DataCategories>();
  @observable
  bool isShowLoading = false;
  List<Category> category;

  _FilterScreenStore(this.categoryRepository);

  @action
  Future<void> createListCategories(BuildContext context) async {
    listDataCategories.clear();
    isShowLoading = true;

    category = await categoryRepository.getCategories();

    for (var i = 0; i < category.length; i++) {
      listDataCategories.add(DataCategories(
          id: category[i].id,
          name: category[i].name,
          description: category[i].description,
          isSelected: false));
    }
    isShowLoading = false;
  }

  @action
  void checkClick(int index) {
    // listDataCategories.forEach((element) {
    //   element.isSelected = false;
    // });
    for(final element in listDataCategories) {
      element.isSelected = false;
    }
    listDataCategories[index].isSelected = true;
    listDataCategories
        .replaceRange(index, index + 1, [listDataCategories[index]]);
  }

  @action
  // TODO: updateCategory func
  void updateCategory(Category category) {}
}
