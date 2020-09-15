import 'dart:async';
import 'package:cooking/app/app.dart';
import 'package:cooking/db/db.dart';

class CategoryRepository {
  CategoryRepository();

  Future<List<Category>> getCategories() async {
    final categories = await App.db.getCategories();

    return categories;
  }

  Future<int> createCategory(Category category) async {
    return App.db.createCategory(category.toCompanion(false));
  }

  Future<bool> updateCategory(Category category) {
    return App.db.updateCategory(category.toCompanion(false));
  }
}
