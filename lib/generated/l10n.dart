// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Recipe name`
  String get recipeName {
    return Intl.message(
      'Recipe name',
      name: 'recipeName',
      desc: '',
      args: [],
    );
  }

  /// `Add Category`
  String get addCategory {
    return Intl.message(
      'Add Category',
      name: 'addCategory',
      desc: '',
      args: [],
    );
  }

  /// `Add new category`
  String get addNewCategory {
    return Intl.message(
      'Add new category',
      name: 'addNewCategory',
      desc: '',
      args: [],
    );
  }

  /// `Category name`
  String get categoryName {
    return Intl.message(
      'Category name',
      name: 'categoryName',
      desc: '',
      args: [],
    );
  }

  /// `Category description`
  String get categoryDescription {
    return Intl.message(
      'Category description',
      name: 'categoryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add an ingredient`
  String get addAnIngredients {
    return Intl.message(
      'Add an ingredient',
      name: 'addAnIngredients',
      desc: '',
      args: [],
    );
  }

  /// `Ingredient name`
  String get ingredientName {
    return Intl.message(
      'Ingredient name',
      name: 'ingredientName',
      desc: '',
      args: [],
    );
  }

  /// `Ingredient amount`
  String get ingredientAmount {
    return Intl.message(
      'Ingredient amount',
      name: 'ingredientAmount',
      desc: '',
      args: [],
    );
  }

  /// `SAVE`
  String get save {
    return Intl.message(
      'SAVE',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Add a step`
  String get addAStep {
    return Intl.message(
      'Add a step',
      name: 'addAStep',
      desc: '',
      args: [],
    );
  }

  /// `Step content`
  String get stepContent {
    return Intl.message(
      'Step content',
      name: 'stepContent',
      desc: '',
      args: [],
    );
  }

  /// `Add photo`
  String get addPhoto {
    return Intl.message(
      'Add photo',
      name: 'addPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Edit category`
  String get editCategory {
    return Intl.message(
      'Edit category',
      name: 'editCategory',
      desc: '',
      args: [],
    );
  }

  /// `MANAGE CATEGORIES`
  String get manageCategories {
    return Intl.message(
      'MANAGE CATEGORIES',
      name: 'manageCategories',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get unit {
    return Intl.message(
      'Unit',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `DONE`
  String get done {
    return Intl.message(
      'DONE',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Recipe`
  String get recipe {
    return Intl.message(
      'Recipe',
      name: 'recipe',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get import {
    return Intl.message(
      'Import',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  /// `Export`
  String get export {
    return Intl.message(
      'Export',
      name: 'export',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `ADD`
  String get add {
    return Intl.message(
      'ADD',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Select categories to filter`
  String get textFilter {
    return Intl.message(
      'Select categories to filter',
      name: 'textFilter',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message(
      'Summary',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `Directions`
  String get directions {
    return Intl.message(
      'Directions',
      name: 'directions',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get ingredients {
    return Intl.message(
      'Ingredients',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `Select categories to filter`
  String get textFilterScreenSelect {
    return Intl.message(
      'Select categories to filter',
      name: 'textFilterScreenSelect',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove this recipe out of your Favorite?`
  String get question {
    return Intl.message(
      'Are you sure you want to remove this recipe out of your Favorite?',
      name: 'question',
      desc: '',
      args: [],
    );
  }

  /// `YES`
  String get yes {
    return Intl.message(
      'YES',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No,thanks!`
  String get no {
    return Intl.message(
      'No,thanks!',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Open Camera`
  String get openCamera {
    return Intl.message(
      'Open Camera',
      name: 'openCamera',
      desc: '',
      args: [],
    );
  }

  /// `Open Gallery`
  String get takeAPhoto {
    return Intl.message(
      'Open Gallery',
      name: 'takeAPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `CATEGORIES`
  String get categories {
    return Intl.message(
      'CATEGORIES',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Cooking`
  String get cooking {
    return Intl.message(
      'Cooking',
      name: 'cooking',
      desc: '',
      args: [],
    );
  }

  /// `Preparation`
  String get preparation {
    return Intl.message(
      'Preparation',
      name: 'preparation',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friends`
  String get invite {
    return Intl.message(
      'Invite Friends',
      name: 'invite',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Select All`
  String get selectAll {
    return Intl.message(
      'Select All',
      name: 'selectAll',
      desc: '',
      args: [],
    );
  }

  /// `Unselect all`
  String get unSelectAll {
    return Intl.message(
      'Unselect all',
      name: 'unSelectAll',
      desc: '',
      args: [],
    );
  }

  /// `Export to JSON`
  String get exportToJson {
    return Intl.message(
      'Export to JSON',
      name: 'exportToJson',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get noDialog {
    return Intl.message(
      'No',
      name: 'noDialog',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to import ?`
  String get questDialog {
    return Intl.message(
      'Are you sure you want to import ?',
      name: 'questDialog',
      desc: '',
      args: [],
    );
  }

  /// `The recipe list is empty.\nPlease add your recipe!`
  String get msgLoadRecipeError {
    return Intl.message(
      'The recipe list is empty.\nPlease add your recipe!',
      name: 'msgLoadRecipeError',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `There is no recipe.\nPlease add your recipe!`
  String get msgNoRecipe {
    return Intl.message(
      'There is no recipe.\nPlease add your recipe!',
      name: 'msgNoRecipe',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `mins`
  String get mins {
    return Intl.message(
      'mins',
      name: 'mins',
      desc: '',
      args: [],
    );
  }

  /// `Please enter time`
  String get msgPleaseEnterTime {
    return Intl.message(
      'Please enter time',
      name: 'msgPleaseEnterTime',
      desc: '',
      args: [],
    );
  }

  /// `Please provide directions!`
  String get msgPleaseProvideDirections {
    return Intl.message(
      'Please provide directions!',
      name: 'msgPleaseProvideDirections',
      desc: '',
      args: [],
    );
  }

  /// `Please provide ingredients!`
  String get msgPleaseProvideIngredients {
    return Intl.message(
      'Please provide ingredients!',
      name: 'msgPleaseProvideIngredients',
      desc: '',
      args: [],
    );
  }

  /// `There is no recipes in your favorite list!`
  String get msgThereIsNoFavoriteRecipes {
    return Intl.message(
      'There is no recipes in your favorite list!',
      name: 'msgThereIsNoFavoriteRecipes',
      desc: '',
      args: [],
    );
  }

  /// `There is no recipe in`
  String get msgNoRecipeIn {
    return Intl.message(
      'There is no recipe in',
      name: 'msgNoRecipeIn',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Checkout our app on store: https://google.com`
  String get msgShare {
    return Intl.message(
      'Checkout our app on store: https://google.com',
      name: 'msgShare',
      desc: '',
      args: [],
    );
  }

  /// `Cookbook in your hand!`
  String get shareSubject {
    return Intl.message(
      'Cookbook in your hand!',
      name: 'shareSubject',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get fr {
    return Intl.message(
      'French',
      name: 'fr',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get vi {
    return Intl.message(
      'Vietnamese',
      name: 'vi',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}