import 'package:cooking/app/app.dart';
import 'package:cooking/db/db.dart';
import 'package:cooking/repository/recipe_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDB extends Mock implements DB {}

void main() {
  RecipeRepository recipeRepository;


  // Before test
  setUp(() {
    recipeRepository = RecipeRepository();
    App.db = MockDB();
  });

  // After test
  tearDown(() {});

  group('Test Recipe Repository', () {
    test('Test create recipe', () async {
      final Recipe recipe =
          Recipe(id: 1, name: 'Soft Beef', description: 'Softbeef with tea', note : 'This is recipe beef test');

      // Mock: create recipe, return its id
      when(App.db.createRecipe(recipe.toCompanion(true)))
          .thenAnswer((_) async => recipe.id);

      // Create recipe
      final int result = await recipeRepository.createRecipe(recipe);

      // Verify
      expect(result, recipe.id);
    });


    // TODO: Write test
    test('Test get recipe', () async {
      // Create category
      List<Recipe> result = await recipeRepository.getRecipes(1,1);

      // Verify
      expect(result.length, 1);
    });
  });
}
