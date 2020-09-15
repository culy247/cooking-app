// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExportStore on _ExportStore, Store {
  final _$isLoadingAtom = Atom(name: '_ExportStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$recipeListAtom = Atom(name: '_ExportStore.recipeList');

  @override
  ObservableList<RecipeModel> get recipeList {
    _$recipeListAtom.reportRead();
    return super.recipeList;
  }

  @override
  set recipeList(ObservableList<RecipeModel> value) {
    _$recipeListAtom.reportWrite(value, super.recipeList, () {
      super.recipeList = value;
    });
  }

  final _$getRecipesAsyncAction = AsyncAction('_ExportStore.getRecipes');

  @override
  Future<void> getRecipes() {
    return _$getRecipesAsyncAction.run(() => super.getRecipes());
  }

  final _$_ExportStoreActionController = ActionController(name: '_ExportStore');

  @override
  void updateRecipeSelectedState(int index, bool newState) {
    final _$actionInfo = _$_ExportStoreActionController.startAction(
        name: '_ExportStore.updateRecipeSelectedState');
    try {
      return super.updateRecipeSelectedState(index, newState);
    } finally {
      _$_ExportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectAllRecipes() {
    final _$actionInfo = _$_ExportStoreActionController.startAction(
        name: '_ExportStore.selectAllRecipes');
    try {
      return super.selectAllRecipes();
    } finally {
      _$_ExportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselectAllRecipes() {
    final _$actionInfo = _$_ExportStoreActionController.startAction(
        name: '_ExportStore.unselectAllRecipes');
    try {
      return super.unselectAllRecipes();
    } finally {
      _$_ExportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
recipeList: ${recipeList}
    ''';
  }
}
