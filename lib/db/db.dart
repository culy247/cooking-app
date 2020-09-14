import 'dart:io';
import 'package:cooking/utils/logger.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

@DataClassName('Recipe')
class Recipes extends Table {
  IntColumn get id =>
      integer().clientDefault(() => DateTime.now().millisecondsSinceEpoch)();

  TextColumn get name => text()();

  TextColumn get description => text()();

  TextColumn get note => text().nullable()();

  IntColumn get preparationTime => integer().withDefault(const Constant(0))();

  IntColumn get cookingTime => integer().withDefault(const Constant(0))();

  IntColumn get categoryId =>
      integer().customConstraint('REFERENCES Categories(id)')();

  BlobColumn get photo => blob().nullable()();

  TextColumn get ingredients => text()();

  TextColumn get ingredientsNote => text().nullable()();

  TextColumn get directions => text()();

  TextColumn get directionsNote => text().nullable()();

  BoolColumn get isFavorite =>
      boolean().withDefault(const Constant(false)).nullable()();
}

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer()
      .clientDefault(() => DateTime.now().millisecondsSinceEpoch)
      .autoIncrement()();

  TextColumn get name => text()();

  TextColumn get description => text()();
}

@UseMoor(tables: [Recipes, Categories])
class DB extends _$DB {
  DB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Recipe>> getRecipes({int limit, int offset}) {
    final Future<List<Recipe>> result = (select(recipes)
          ..limit(limit ?? 100, offset: offset ?? 0))
        .get()
        .catchError((error) {
      AppLogger.instance.e(error);
    });

    return result;
  }

  Future<List<Recipe>> getFavoriteRecipes({int limit, int offset}) {
    final Future<List<Recipe>> result = (select(recipes)
          ..limit(limit ?? 100, offset: offset ?? 0)
          ..where((tbl) => tbl.isFavorite))
        .get()
        .catchError((error) {
      AppLogger.instance.e(error);
    });

    return result;
  }

  Future<List<Recipe>> searchRecipes(String keyword, {bool isFavorite}) {
    final query = select(recipes)
      ..where((tbl) {
        return tbl.name?.lower()?.contains(keyword.toLowerCase()) |
            tbl.description?.lower()?.contains(keyword.toLowerCase()) |
            tbl.note?.lower()?.contains(keyword.toLowerCase()) |
            tbl.ingredients?.lower()?.contains(keyword.toLowerCase()) |
            tbl.description?.lower()?.contains(keyword.toLowerCase());
      });
    if (isFavorite != null && isFavorite) {
      query.where((tbl) => tbl.isFavorite);
    }
    final Future<List<Recipe>> result = query.get().catchError((error) {
      AppLogger.instance.e(error);
    });

    return result;
  }

  Future<void> createRecipe(RecipesCompanion entry) {
    return into(recipes).insert(entry).catchError((error) {
      AppLogger.instance.e(error);
    });
  }

  Future<int> addRecipeToFavorite(int recipeId, {bool isFavorite}) {
    final query = update(recipes)..where((tbl) => tbl.id.equals(recipeId));
    return query
        .write(RecipesCompanion(isFavorite: Value(isFavorite)))
        .catchError((error) {
      AppLogger.instance.e(error);
    });
  }

  Future<void> createCategory(CategoriesCompanion entry) {
    return into(categories)
        .insert(entry, mode: InsertMode.insertOrReplace)
        .catchError((error) {
      AppLogger.instance.e(error);
    });
  }

  Future<void> insertCategories(List<Category> categoryList) async {
    await batch((batch) {
      batch.insertAll(categories, categoryList,
          mode: InsertMode.insertOrIgnore);
    }).catchError((error) {
      AppLogger.instance.e(error);
    });
  }

  Future<List<Category>> getCategories() {
    return select(categories).get();
  }

  Future<bool> updateCategory(CategoriesCompanion category) {
    return update(categories).replace(category);
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
