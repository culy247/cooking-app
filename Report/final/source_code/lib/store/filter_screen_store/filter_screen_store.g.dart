// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterScreenStore on _FilterScreenStore, Store {
  final _$listDataCategoriesAtom =
      Atom(name: '_FilterScreenStore.listDataCategories');

  @override
  ObservableList<DataCategories> get listDataCategories {
    _$listDataCategoriesAtom.reportRead();
    return super.listDataCategories;
  }

  @override
  set listDataCategories(ObservableList<DataCategories> value) {
    _$listDataCategoriesAtom.reportWrite(value, super.listDataCategories, () {
      super.listDataCategories = value;
    });
  }

  final _$isShowLoadingAtom = Atom(name: '_FilterScreenStore.isShowLoading');

  @override
  bool get isShowLoading {
    _$isShowLoadingAtom.reportRead();
    return super.isShowLoading;
  }

  @override
  set isShowLoading(bool value) {
    _$isShowLoadingAtom.reportWrite(value, super.isShowLoading, () {
      super.isShowLoading = value;
    });
  }

  final _$createListCategoriesAsyncAction =
      AsyncAction('_FilterScreenStore.createListCategories');

  @override
  Future<void> createListCategories(BuildContext context) {
    return _$createListCategoriesAsyncAction
        .run(() => super.createListCategories(context));
  }

  final _$_FilterScreenStoreActionController =
      ActionController(name: '_FilterScreenStore');

  @override
  void checkClick(int index) {
    final _$actionInfo = _$_FilterScreenStoreActionController.startAction(
        name: '_FilterScreenStore.checkClick');
    try {
      return super.checkClick(index);
    } finally {
      _$_FilterScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCategory(dynamic category) {
    final _$actionInfo = _$_FilterScreenStoreActionController.startAction(
        name: '_FilterScreenStore.updateCategory');
    try {
      return super.updateCategory(category);
    } finally {
      _$_FilterScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listDataCategories: ${listDataCategories},
isShowLoading: ${isShowLoading}
    ''';
  }
}
