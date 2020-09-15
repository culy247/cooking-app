import 'package:cooking/db/db.dart';
import 'package:cooking/model/recipe_model.dart';
import 'package:cooking/repository/recipe_repository.dart';
import 'package:mobx/mobx.dart';
part 'export_store.g.dart';

class ExportStore = _ExportStore with _$ExportStore;

abstract class _ExportStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<RecipeModel> recipeList = ObservableList<RecipeModel>();

  @action
  Future<void> getRecipes() async {
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
  void updateRecipeSelectedState(int index, bool newState) {
    final RecipeModel recipeModel = RecipeModel.copy(recipeList[index]);
    recipeModel.isSelected = newState;

    recipeList.replaceRange(index, index + 1, [recipeModel]);
  }

  @action
  void selectAllRecipes() {
    for (final RecipeModel recipeModel in recipeList) {
      recipeModel.isSelected = true;
    }
  }

  @action
  void unselectAllRecipes() {
    for (final RecipeModel recipeModel in recipeList) {
      recipeModel.isSelected = false;
    }
  }
}
