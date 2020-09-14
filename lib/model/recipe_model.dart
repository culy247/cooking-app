import 'dart:typed_data';

import 'package:cooking/constants/constants.dart';
import 'package:cooking/db/db.dart';
import 'package:mobx/mobx.dart';

class RecipeModel {
  final int id;
  final String name;
  final String description;
  final String note;
  final int preparationTime;
  final int cookingTime;
  final int categoryId;
  final Uint8List photo;
  final List<String> ingredients;
  final List<String> directions;
  final String directionNote;
  final bool isFavorite;
  @observable
  bool isSelected;

  RecipeModel({
    this.id,
    this.name,
    this.description,
    this.note,
    this.preparationTime,
    this.cookingTime,
    this.categoryId,
    this.photo,
    this.ingredients,
    this.directions,
    this.directionNote,
    this.isFavorite,
    this.isSelected = true,
  });

  factory RecipeModel.fromRecipe(Recipe recipe) {
    return RecipeModel(
        id: recipe.id,
        name: recipe.name,
        description: recipe.description,
        note: recipe.note,
        preparationTime: recipe.preparationTime,
        cookingTime: recipe.cookingTime,
        categoryId: recipe.categoryId,
        photo: recipe.photo,
        ingredients: parseIngredients(recipe.ingredients),
        directions: parseDirections(recipe.directions),
        directionNote: recipe.directionsNote,
        isFavorite: recipe.isFavorite);
  }

  factory RecipeModel.copy(RecipeModel recipe) {
    return RecipeModel(
        id: recipe.id,
        name: recipe.name,
        description: recipe.description,
        note: recipe.note,
        preparationTime: recipe.preparationTime,
        cookingTime: recipe.cookingTime,
        categoryId: recipe.categoryId,
        photo: recipe.photo,
        ingredients: recipe.ingredients,
        directions: recipe.directions,
        directionNote: recipe.directionNote,
        isSelected: recipe.isSelected,
        isFavorite: recipe.isFavorite);
  }
}

List<String> parseIngredients(String s) {
  if (s == null || s.isEmpty) {
    return [];
  }
  return s.split(Constants.ADD_SEPARATOR);
}

List<String> parseDirections(String s) {
  if (s == null || s.isEmpty) {
    return [];
  }
  return s.split(Constants.AND_SEPARATOR);
}
