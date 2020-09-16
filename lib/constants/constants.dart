import 'package:cooking/db/db.dart';

class Constants {
  static const String RECIPE_NAME = 'recipeName';
  static const String DESCRIPTION = 'description';
  static const String CATEGORY = 'category';
  static const String TIME_PREPARATION = 'timePreparation';
  static const String TIME_COOKING = 'timeCooking';
  static const String NOTE = 'note';
  static const String INGREDIENTS = 'ingredients';
  static const String DIRECTIONS = 'Directions';

  static List<Category> defaultCategory = [
    Category(id: 1, name: 'Breakfast', description: 'Breakfast'),
    Category(id: 2, name: 'Lunch', description: 'Lunch'),
    Category(id: 3, name: 'Dinner', description: 'Dinner'),
    Category(id: 4, name: 'Chicken', description: 'Chicken'),
    Category(id: 5, name: 'Vegetarian', description: 'Vegetarian'),
    Category(id: 6, name: 'Desserts', description: 'Desserts'),
    Category(id: 7, name: 'Salads', description: 'Salads')
  ];

  static const String AND_SEPARATOR = '&&&';
  static const String ADD_SEPARATOR = '+++';

  static const List<String> LANGUAGES = [
    'English', 'French', 'Vietnamese'
  ];

  static const String ANALYTICS_EVENT_CREATE_RECIPE = 'create_recipe';
  static const String ANALYTICS_SHARE = 'share';
}
