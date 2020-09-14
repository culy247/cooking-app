import 'package:cooking/app/app.dart';
import 'package:cooking/db/db.dart';
import 'package:cooking/repository/category_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDB extends Mock implements DB {}

void main() {
  CategoryRepository categoryRepository;

  // Before test
  setUp(() {
    categoryRepository = CategoryRepository();
    App.db = MockDB();
  });

  // After test
  tearDown(() {});

  group('Test Category Repository', () {
    test('Test create category', () async {
      final Category category =
          Category(id: 1, name: 'Lunch', description: 'Lunch description');

      // Mock: create category, return its id
      when(App.db.createCategory(category.toCompanion(true)))
          .thenAnswer((_) async => category.id);

      // Create category
      final int result = await categoryRepository.createCategory(category);

      // Verify
      expect(result, category.id);
    });

    test('Test update category', () async {
      final Category category = Category(
          id: 1, name: 'Lunch', description: 'Lunch description - Updated');

      // Mock: create category, return its id
      when(App.db.updateCategory(category.toCompanion(true)))
          .thenAnswer((_) async => true);

      // Create category
      final bool result = await categoryRepository.updateCategory(category);

      // Verify
      expect(result, true);
    });

    test('Test get categories', () async {
      final Category category = Category(
          id: 1, name: 'Lunch', description: 'Lunch description - Updated');

      // Mock: create category, return its id
      when(App.db.getCategories()).thenAnswer((_) async => [category]);

      // Get categories
      final List<Category> categories =
          await categoryRepository.getCategories();

      expect(categories, isNotNull);
      expect(categories.length, 1);
    });
  });
}
