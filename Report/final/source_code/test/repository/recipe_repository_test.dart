import 'package:cooking/app/app.dart';
import 'package:cooking/db/db.dart';
import 'package:cooking/repository/recipe_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDB extends Mock implements DB {}

void main() {
  RecipeRepository recipeRepository;
  final Recipe recipe = Recipe(
      id: 1,
      name: 'Rice',
      description: 'Rice Description',
      directions: '',
      ingredients: '',
      cookingTime: 14,
      preparationTime: 15,
      categoryId: 1);

  // Before test
  setUp(() {
    recipeRepository = RecipeRepository();
    App.db = MockDB();
  });

  // After test
  tearDown(() {});

  group('Test Recipe Repository', () {
    test('Test create recipe', () async {
      // Mock: create recipe
      when(App.db.createRecipe(recipe.toCompanion(false)))
          .thenAnswer((_) async => recipe.id);

      // Create recipe
      final int result = await recipeRepository.createRecipe(recipe);

      // Verify
      expect(result, recipe.id);
    });

    test('Test get recipes', () async {
      // Mock
      when(App.db.getRecipes()).thenAnswer((_) async => [recipe]);

      final List<Recipe> recipes = await recipeRepository.getRecipes();

      expect(recipes, isNotNull);
      expect(recipes.length, 1);
    });

    test('Test get recipe by category id', () async {
      // Mock
      when(App.db.getRecipeByCategory(1)).thenAnswer((_) async => [recipe]);

      final List<Recipe> recipes =
          await recipeRepository.getRecipesByCategoryId(1);

      expect(recipes, isNotNull);
      expect(recipes.length, 1);
    });

    test('Test get favorite recipes', () async {
      // Mock
      when(App.db.getFavoriteRecipes()).thenAnswer((_) async => [recipe]);

      final List<Recipe> recipes = await recipeRepository.getFavoriteRecipes();

      expect(recipes, isNotNull);
      expect(recipes.length, 1);
    });

    test('Test search recipes', () async {
      // Mock
      when(App.db.searchRecipes('keyword')).thenAnswer((_) async => [recipe]);

      final List<Recipe> recipes =
          await recipeRepository.searchRecipes('keyword');

      expect(recipes, isNotNull);
      expect(recipes.length, 1);
    });

    test('Test add recipe to favorite', () async {
      // Mock
      when(App.db.addRecipeToFavorite(1, isFavorite: true))
          .thenAnswer((_) async => 1);

      final int id =
          await recipeRepository.addRecipeToFavorite(1, isFavorite: true);

      expect(id, isNotNull);
      expect(id, 1);
    });
  });
}
