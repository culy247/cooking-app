// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecipeStore on _RecipeStore, Store {
  final _$isLoadingAtom = Atom(name: '_RecipeStore.isLoading');

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

  final _$recipeListAtom = Atom(name: '_RecipeStore.recipeList');

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

  final _$favoriteRecipesAtom = Atom(name: '_RecipeStore.favoriteRecipes');

  @override
  ObservableList<RecipeModel> get favoriteRecipes {
    _$favoriteRecipesAtom.reportRead();
    return super.favoriteRecipes;
  }

  @override
  set favoriteRecipes(ObservableList<RecipeModel> value) {
    _$favoriteRecipesAtom.reportWrite(value, super.favoriteRecipes, () {
      super.favoriteRecipes = value;
    });
  }

  final _$searchedRecipesAtom = Atom(name: '_RecipeStore.searchedRecipes');

  @override
  ObservableList<RecipeModel> get searchedRecipes {
    _$searchedRecipesAtom.reportRead();
    return super.searchedRecipes;
  }

  @override
  set searchedRecipes(ObservableList<RecipeModel> value) {
    _$searchedRecipesAtom.reportWrite(value, super.searchedRecipes, () {
      super.searchedRecipes = value;
    });
  }

  final _$filteredRecipesAtom = Atom(name: '_RecipeStore.filteredRecipes');

  @override
  ObservableList<RecipeModel> get filteredRecipes {
    _$filteredRecipesAtom.reportRead();
    return super.filteredRecipes;
  }

  @override
  set filteredRecipes(ObservableList<RecipeModel> value) {
    _$filteredRecipesAtom.reportWrite(value, super.filteredRecipes, () {
      super.filteredRecipes = value;
    });
  }

  final _$getRecipesAsyncAction = AsyncAction('_RecipeStore.getRecipes');

  @override
  Future<void> getRecipes({bool onlyFavorite = false}) {
    return _$getRecipesAsyncAction
        .run(() => super.getRecipes(onlyFavorite: onlyFavorite));
  }

  final _$getFavoriteRecipesAsyncAction =
      AsyncAction('_RecipeStore.getFavoriteRecipes');

  @override
  Future<void> getFavoriteRecipes() {
    return _$getFavoriteRecipesAsyncAction
        .run(() => super.getFavoriteRecipes());
  }

  final _$saveRecipeToDBAsyncAction =
      AsyncAction('_RecipeStore.saveRecipeToDB');

  @override
  Future<void> saveRecipeToDB(dynamic recipe) {
    return _$saveRecipeToDBAsyncAction.run(() => super.saveRecipeToDB(recipe));
  }

  final _$searchRecipeAsyncAction = AsyncAction('_RecipeStore.searchRecipe');

  @override
  Future<void> searchRecipe(String keyword, {bool isFavorite}) {
    return _$searchRecipeAsyncAction
        .run(() => super.searchRecipe(keyword, isFavorite: isFavorite));
  }

  final _$addRecipeToFavoriteAsyncAction =
      AsyncAction('_RecipeStore.addRecipeToFavorite');

  @override
  Future<void> addRecipeToFavorite(int recipeId, {bool isFavorite}) {
    return _$addRecipeToFavoriteAsyncAction
        .run(() => super.addRecipeToFavorite(recipeId, isFavorite: isFavorite));
  }

  final _$getRecipesByCategoryAsyncAction =
      AsyncAction('_RecipeStore.getRecipesByCategory');

  @override
  Future<void> getRecipesByCategory(int categoryId) {
    return _$getRecipesByCategoryAsyncAction
        .run(() => super.getRecipesByCategory(categoryId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
recipeList: ${recipeList},
favoriteRecipes: ${favoriteRecipes},
searchedRecipes: ${searchedRecipes},
filteredRecipes: ${filteredRecipes}
    ''';
  }
}
