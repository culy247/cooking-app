// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Recipe extends DataClass implements Insertable<Recipe> {
  final int id;
  final String name;
  final String description;
  final String note;
  final int preparationTime;
  final int cookingTime;
  final int categoryId;
  final Uint8List photo;
  final String ingredients;
  final String ingredientsNote;
  final String directions;
  final String directionsNote;
  final bool isFavorite;
  Recipe(
      {@required this.id,
      @required this.name,
      @required this.description,
      this.note,
      @required this.preparationTime,
      @required this.cookingTime,
      @required this.categoryId,
      this.photo,
      @required this.ingredients,
      this.ingredientsNote,
      @required this.directions,
      this.directionsNote,
      this.isFavorite});
  factory Recipe.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final uint8ListType = db.typeSystem.forDartType<Uint8List>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Recipe(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      preparationTime: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}preparation_time']),
      cookingTime: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}cooking_time']),
      categoryId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id']),
      photo: uint8ListType
          .mapFromDatabaseResponse(data['${effectivePrefix}photo']),
      ingredients: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ingredients']),
      ingredientsNote: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ingredients_note']),
      directions: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}directions']),
      directionsNote: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}directions_note']),
      isFavorite: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_favorite']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || preparationTime != null) {
      map['preparation_time'] = Variable<int>(preparationTime);
    }
    if (!nullToAbsent || cookingTime != null) {
      map['cooking_time'] = Variable<int>(cookingTime);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    if (!nullToAbsent || photo != null) {
      map['photo'] = Variable<Uint8List>(photo);
    }
    if (!nullToAbsent || ingredients != null) {
      map['ingredients'] = Variable<String>(ingredients);
    }
    if (!nullToAbsent || ingredientsNote != null) {
      map['ingredients_note'] = Variable<String>(ingredientsNote);
    }
    if (!nullToAbsent || directions != null) {
      map['directions'] = Variable<String>(directions);
    }
    if (!nullToAbsent || directionsNote != null) {
      map['directions_note'] = Variable<String>(directionsNote);
    }
    if (!nullToAbsent || isFavorite != null) {
      map['is_favorite'] = Variable<bool>(isFavorite);
    }
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      preparationTime: preparationTime == null && nullToAbsent
          ? const Value.absent()
          : Value(preparationTime),
      cookingTime: cookingTime == null && nullToAbsent
          ? const Value.absent()
          : Value(cookingTime),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      photo:
          photo == null && nullToAbsent ? const Value.absent() : Value(photo),
      ingredients: ingredients == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredients),
      ingredientsNote: ingredientsNote == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredientsNote),
      directions: directions == null && nullToAbsent
          ? const Value.absent()
          : Value(directions),
      directionsNote: directionsNote == null && nullToAbsent
          ? const Value.absent()
          : Value(directionsNote),
      isFavorite: isFavorite == null && nullToAbsent
          ? const Value.absent()
          : Value(isFavorite),
    );
  }

  factory Recipe.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Recipe(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      note: serializer.fromJson<String>(json['note']),
      preparationTime: serializer.fromJson<int>(json['preparationTime']),
      cookingTime: serializer.fromJson<int>(json['cookingTime']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      photo: serializer.fromJson<Uint8List>(json['photo']),
      ingredients: serializer.fromJson<String>(json['ingredients']),
      ingredientsNote: serializer.fromJson<String>(json['ingredientsNote']),
      directions: serializer.fromJson<String>(json['directions']),
      directionsNote: serializer.fromJson<String>(json['directionsNote']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'note': serializer.toJson<String>(note),
      'preparationTime': serializer.toJson<int>(preparationTime),
      'cookingTime': serializer.toJson<int>(cookingTime),
      'categoryId': serializer.toJson<int>(categoryId),
      'photo': serializer.toJson<Uint8List>(photo),
      'ingredients': serializer.toJson<String>(ingredients),
      'ingredientsNote': serializer.toJson<String>(ingredientsNote),
      'directions': serializer.toJson<String>(directions),
      'directionsNote': serializer.toJson<String>(directionsNote),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  Recipe copyWith(
          {int id,
          String name,
          String description,
          String note,
          int preparationTime,
          int cookingTime,
          int categoryId,
          Uint8List photo,
          String ingredients,
          String ingredientsNote,
          String directions,
          String directionsNote,
          bool isFavorite}) =>
      Recipe(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        note: note ?? this.note,
        preparationTime: preparationTime ?? this.preparationTime,
        cookingTime: cookingTime ?? this.cookingTime,
        categoryId: categoryId ?? this.categoryId,
        photo: photo ?? this.photo,
        ingredients: ingredients ?? this.ingredients,
        ingredientsNote: ingredientsNote ?? this.ingredientsNote,
        directions: directions ?? this.directions,
        directionsNote: directionsNote ?? this.directionsNote,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  String toString() {
    return (StringBuffer('Recipe(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('note: $note, ')
          ..write('preparationTime: $preparationTime, ')
          ..write('cookingTime: $cookingTime, ')
          ..write('categoryId: $categoryId, ')
          ..write('photo: $photo, ')
          ..write('ingredients: $ingredients, ')
          ..write('ingredientsNote: $ingredientsNote, ')
          ..write('directions: $directions, ')
          ..write('directionsNote: $directionsNote, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  note.hashCode,
                  $mrjc(
                      preparationTime.hashCode,
                      $mrjc(
                          cookingTime.hashCode,
                          $mrjc(
                              categoryId.hashCode,
                              $mrjc(
                                  photo.hashCode,
                                  $mrjc(
                                      ingredients.hashCode,
                                      $mrjc(
                                          ingredientsNote.hashCode,
                                          $mrjc(
                                              directions.hashCode,
                                              $mrjc(
                                                  directionsNote.hashCode,
                                                  isFavorite
                                                      .hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Recipe &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.note == this.note &&
          other.preparationTime == this.preparationTime &&
          other.cookingTime == this.cookingTime &&
          other.categoryId == this.categoryId &&
          other.photo == this.photo &&
          other.ingredients == this.ingredients &&
          other.ingredientsNote == this.ingredientsNote &&
          other.directions == this.directions &&
          other.directionsNote == this.directionsNote &&
          other.isFavorite == this.isFavorite);
}

class RecipesCompanion extends UpdateCompanion<Recipe> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> note;
  final Value<int> preparationTime;
  final Value<int> cookingTime;
  final Value<int> categoryId;
  final Value<Uint8List> photo;
  final Value<String> ingredients;
  final Value<String> ingredientsNote;
  final Value<String> directions;
  final Value<String> directionsNote;
  final Value<bool> isFavorite;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
    this.preparationTime = const Value.absent(),
    this.cookingTime = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.photo = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.ingredientsNote = const Value.absent(),
    this.directions = const Value.absent(),
    this.directionsNote = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  RecipesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String description,
    this.note = const Value.absent(),
    this.preparationTime = const Value.absent(),
    this.cookingTime = const Value.absent(),
    @required int categoryId,
    this.photo = const Value.absent(),
    @required String ingredients,
    this.ingredientsNote = const Value.absent(),
    @required String directions,
    this.directionsNote = const Value.absent(),
    this.isFavorite = const Value.absent(),
  })  : name = Value(name),
        description = Value(description),
        categoryId = Value(categoryId),
        ingredients = Value(ingredients),
        directions = Value(directions);
  static Insertable<Recipe> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> description,
    Expression<String> note,
    Expression<int> preparationTime,
    Expression<int> cookingTime,
    Expression<int> categoryId,
    Expression<Uint8List> photo,
    Expression<String> ingredients,
    Expression<String> ingredientsNote,
    Expression<String> directions,
    Expression<String> directionsNote,
    Expression<bool> isFavorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (note != null) 'note': note,
      if (preparationTime != null) 'preparation_time': preparationTime,
      if (cookingTime != null) 'cooking_time': cookingTime,
      if (categoryId != null) 'category_id': categoryId,
      if (photo != null) 'photo': photo,
      if (ingredients != null) 'ingredients': ingredients,
      if (ingredientsNote != null) 'ingredients_note': ingredientsNote,
      if (directions != null) 'directions': directions,
      if (directionsNote != null) 'directions_note': directionsNote,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  RecipesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> note,
      Value<int> preparationTime,
      Value<int> cookingTime,
      Value<int> categoryId,
      Value<Uint8List> photo,
      Value<String> ingredients,
      Value<String> ingredientsNote,
      Value<String> directions,
      Value<String> directionsNote,
      Value<bool> isFavorite}) {
    return RecipesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      note: note ?? this.note,
      preparationTime: preparationTime ?? this.preparationTime,
      cookingTime: cookingTime ?? this.cookingTime,
      categoryId: categoryId ?? this.categoryId,
      photo: photo ?? this.photo,
      ingredients: ingredients ?? this.ingredients,
      ingredientsNote: ingredientsNote ?? this.ingredientsNote,
      directions: directions ?? this.directions,
      directionsNote: directionsNote ?? this.directionsNote,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (preparationTime.present) {
      map['preparation_time'] = Variable<int>(preparationTime.value);
    }
    if (cookingTime.present) {
      map['cooking_time'] = Variable<int>(cookingTime.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (photo.present) {
      map['photo'] = Variable<Uint8List>(photo.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(ingredients.value);
    }
    if (ingredientsNote.present) {
      map['ingredients_note'] = Variable<String>(ingredientsNote.value);
    }
    if (directions.present) {
      map['directions'] = Variable<String>(directions.value);
    }
    if (directionsNote.present) {
      map['directions_note'] = Variable<String>(directionsNote.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('note: $note, ')
          ..write('preparationTime: $preparationTime, ')
          ..write('cookingTime: $cookingTime, ')
          ..write('categoryId: $categoryId, ')
          ..write('photo: $photo, ')
          ..write('ingredients: $ingredients, ')
          ..write('ingredientsNote: $ingredientsNote, ')
          ..write('directions: $directions, ')
          ..write('directionsNote: $directionsNote, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, Recipe> {
  final GeneratedDatabase _db;
  final String _alias;
  $RecipesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().millisecondsSinceEpoch;
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      true,
    );
  }

  final VerificationMeta _preparationTimeMeta =
      const VerificationMeta('preparationTime');
  GeneratedIntColumn _preparationTime;
  @override
  GeneratedIntColumn get preparationTime =>
      _preparationTime ??= _constructPreparationTime();
  GeneratedIntColumn _constructPreparationTime() {
    return GeneratedIntColumn('preparation_time', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _cookingTimeMeta =
      const VerificationMeta('cookingTime');
  GeneratedIntColumn _cookingTime;
  @override
  GeneratedIntColumn get cookingTime =>
      _cookingTime ??= _constructCookingTime();
  GeneratedIntColumn _constructCookingTime() {
    return GeneratedIntColumn('cooking_time', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  GeneratedIntColumn _categoryId;
  @override
  GeneratedIntColumn get categoryId => _categoryId ??= _constructCategoryId();
  GeneratedIntColumn _constructCategoryId() {
    return GeneratedIntColumn('category_id', $tableName, false,
        $customConstraints: 'REFERENCES Categories(id)');
  }

  final VerificationMeta _photoMeta = const VerificationMeta('photo');
  GeneratedBlobColumn _photo;
  @override
  GeneratedBlobColumn get photo => _photo ??= _constructPhoto();
  GeneratedBlobColumn _constructPhoto() {
    return GeneratedBlobColumn(
      'photo',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ingredientsMeta =
      const VerificationMeta('ingredients');
  GeneratedTextColumn _ingredients;
  @override
  GeneratedTextColumn get ingredients =>
      _ingredients ??= _constructIngredients();
  GeneratedTextColumn _constructIngredients() {
    return GeneratedTextColumn(
      'ingredients',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ingredientsNoteMeta =
      const VerificationMeta('ingredientsNote');
  GeneratedTextColumn _ingredientsNote;
  @override
  GeneratedTextColumn get ingredientsNote =>
      _ingredientsNote ??= _constructIngredientsNote();
  GeneratedTextColumn _constructIngredientsNote() {
    return GeneratedTextColumn(
      'ingredients_note',
      $tableName,
      true,
    );
  }

  final VerificationMeta _directionsMeta = const VerificationMeta('directions');
  GeneratedTextColumn _directions;
  @override
  GeneratedTextColumn get directions => _directions ??= _constructDirections();
  GeneratedTextColumn _constructDirections() {
    return GeneratedTextColumn(
      'directions',
      $tableName,
      false,
    );
  }

  final VerificationMeta _directionsNoteMeta =
      const VerificationMeta('directionsNote');
  GeneratedTextColumn _directionsNote;
  @override
  GeneratedTextColumn get directionsNote =>
      _directionsNote ??= _constructDirectionsNote();
  GeneratedTextColumn _constructDirectionsNote() {
    return GeneratedTextColumn(
      'directions_note',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isFavoriteMeta = const VerificationMeta('isFavorite');
  GeneratedBoolColumn _isFavorite;
  @override
  GeneratedBoolColumn get isFavorite => _isFavorite ??= _constructIsFavorite();
  GeneratedBoolColumn _constructIsFavorite() {
    return GeneratedBoolColumn('is_favorite', $tableName, true,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        note,
        preparationTime,
        cookingTime,
        categoryId,
        photo,
        ingredients,
        ingredientsNote,
        directions,
        directionsNote,
        isFavorite
      ];
  @override
  $RecipesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'recipes';
  @override
  final String actualTableName = 'recipes';
  @override
  VerificationContext validateIntegrity(Insertable<Recipe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    }
    if (data.containsKey('preparation_time')) {
      context.handle(
          _preparationTimeMeta,
          preparationTime.isAcceptableOrUnknown(
              data['preparation_time'], _preparationTimeMeta));
    }
    if (data.containsKey('cooking_time')) {
      context.handle(
          _cookingTimeMeta,
          cookingTime.isAcceptableOrUnknown(
              data['cooking_time'], _cookingTimeMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id'], _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo'], _photoMeta));
    }
    if (data.containsKey('ingredients')) {
      context.handle(
          _ingredientsMeta,
          ingredients.isAcceptableOrUnknown(
              data['ingredients'], _ingredientsMeta));
    } else if (isInserting) {
      context.missing(_ingredientsMeta);
    }
    if (data.containsKey('ingredients_note')) {
      context.handle(
          _ingredientsNoteMeta,
          ingredientsNote.isAcceptableOrUnknown(
              data['ingredients_note'], _ingredientsNoteMeta));
    }
    if (data.containsKey('directions')) {
      context.handle(
          _directionsMeta,
          directions.isAcceptableOrUnknown(
              data['directions'], _directionsMeta));
    } else if (isInserting) {
      context.missing(_directionsMeta);
    }
    if (data.containsKey('directions_note')) {
      context.handle(
          _directionsNoteMeta,
          directionsNote.isAcceptableOrUnknown(
              data['directions_note'], _directionsNoteMeta));
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite'], _isFavoriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Recipe map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Recipe.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(_db, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final String description;
  Category(
      {@required this.id, @required this.name, @required this.description});
  factory Category.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Category(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  Category copyWith({int id, String name, String description}) => Category(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, description.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String description,
  })  : name = Value(name),
        description = Value(description);
  static Insertable<Category> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int> id, Value<String> name, Value<String> description}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true)
      ..clientDefault = () => DateTime.now().millisecondsSinceEpoch;
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  $CategoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categories';
  @override
  final String actualTableName = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Category.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

abstract class _$DB extends GeneratedDatabase {
  _$DB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $RecipesTable _recipes;
  $RecipesTable get recipes => _recipes ??= $RecipesTable(this);
  $CategoriesTable _categories;
  $CategoriesTable get categories => _categories ??= $CategoriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recipes, categories];
}
