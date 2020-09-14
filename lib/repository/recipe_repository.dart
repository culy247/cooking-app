import 'dart:async';
import 'package:cooking/app/app.dart';
import 'package:cooking/db/db.dart';

class RecipeRepository {
  RecipeRepository();

  Future<List<Recipe>> getRecipes({int limit, int offset}) async {
    final List<Recipe> recipes =
        await App.db.getRecipes(limit: limit, offset: offset);

    return recipes;
  }

  Future<List<Recipe>> getRecipesByCategoryId(int categoryId) async {
    final List<Recipe> recipes =
    await App.db.getRecipeByCategory(categoryId);

    return recipes;
  }

  Future<List<Recipe>> getFavoriteRecipes({int limit, int offset}) async {
    final List<Recipe> recipes =
        await App.db.getFavoriteRecipes(limit: limit, offset: offset);

    return recipes;
  }

  Future<List<Recipe>> searchRecipes(String keyword, {bool isFavorite}) async {
    final List<Recipe> recipes =
        await App.db.searchRecipes(keyword, isFavorite: isFavorite);

    return recipes;
  }

  Future<void> createRecipe(Recipe recipe) async {
    return App.db.createRecipe(recipe.toCompanion(false));
  }

  Future<void> addRecipeToFavorite(int recipeId, {bool isFavorite}) async {
    return App.db.addRecipeToFavorite(recipeId, isFavorite: isFavorite);
  }
}
