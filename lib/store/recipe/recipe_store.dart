import 'package:cooking/db/db.dart';
import 'package:cooking/model/recipe_model.dart';
import 'package:cooking/repository/recipe_repository.dart';
import 'package:mobx/mobx.dart';

part 'recipe_store.g.dart';

class RecipeStore = _RecipeStore with _$RecipeStore;

abstract class _RecipeStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<RecipeModel> recipeList = ObservableList<RecipeModel>();

  @observable
  ObservableList<RecipeModel> favoriteRecipes = ObservableList<RecipeModel>();

  @observable
  ObservableList<RecipeModel> searchedRecipes = ObservableList<RecipeModel>();

  @action
  Future<void> getRecipes({bool onlyFavorite = false}) async {
    // Get favorite recipe
    if (onlyFavorite != null && onlyFavorite) {
      getFavoriteRecipes();
      return;
    }

    isLoading = true;

    recipeList.clear();

    final RecipeRepository recipeRepository = RecipeRepository();
    final List<Recipe> recipes = await recipeRepository.getRecipes();
    if (recipes != null && recipes.isNotEmpty) {
      for (final recipe in recipes) {
        final RecipeModel recipeModel = RecipeModel.fromRecipe(recipe);
        recipeList.add(recipeModel);
      }
    }

    isLoading = false;
  }

  @action
  Future<void> getFavoriteRecipes() async {
    isLoading = true;

    favoriteRecipes.clear();

    final RecipeRepository recipeRepository = RecipeRepository();
    final List<Recipe> recipes = await recipeRepository.getFavoriteRecipes();
    if (recipes != null && recipes.isNotEmpty) {
      for (final recipe in recipes) {
        final RecipeModel recipeModel = RecipeModel.fromRecipe(recipe);
        favoriteRecipes.add(recipeModel);
      }
    }

    isLoading = false;
  }

  @action
  Future<void> saveRecipeToDB(Recipe recipe) async {
    // Save recipe to DB
    final RecipeRepository recipeRepository = RecipeRepository();
    await recipeRepository.createRecipe(recipe);

    // Add recipe to list to show on UI
    recipeList.insert(0, RecipeModel.fromRecipe(recipe));
  }

  @action
  Future<void> searchRecipe(String keyword, {bool isFavorite}) async {
    searchedRecipes.clear();

    if (keyword != null && keyword.isNotEmpty) {
      final RecipeRepository recipeRepository = RecipeRepository();
      final List<Recipe> recipes =
          await recipeRepository.searchRecipes(keyword, isFavorite: isFavorite);
      if (recipes != null && recipes.isNotEmpty) {
        for (final recipe in recipes) {
          final RecipeModel recipeModel = RecipeModel.fromRecipe(recipe);
          searchedRecipes.add(recipeModel);
        }
      }
    }

    isLoading = false;
  }

  @action
  Future<void> addRecipeToFavorite(int recipeId, {bool isFavorite}) async {
    final RecipeRepository recipeRepository = RecipeRepository();
    await recipeRepository.addRecipeToFavorite(recipeId,
        isFavorite: isFavorite);

    // Reload recipes
    getRecipes();

    getFavoriteRecipes();
  }

  /// Update the favorite status of a recipe to trigger UI change
  // void updateRecipeFavorite(int recipeId, {bool isFavorite}) {
  //   final int index =
  //       recipeList.indexWhere((element) => element.id == recipeId);
  //   final RecipeModel updatedRecipe = RecipeModel.copy(recipeList[index]);
  //   recipeList.replaceRange(index, index + 1, [updatedRecipe]);
  // }
}
