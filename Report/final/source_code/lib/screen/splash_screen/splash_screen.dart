import 'dart:async';

import 'package:cooking/constants/constants.dart';
import 'package:cooking/navigation/navigation.dart';
import 'package:cooking/repository/category_repository.dart';
import 'package:cooking/screen/home/home_screen.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/images.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CategoryRepository categoryRepository;

  @override
  void initState() {
    super.initState();
    onWidgetBuildDone(onBuildDone);
  }

  @override
  Widget build(BuildContext context) {
    categoryRepository = Provider.of<CategoryRepository>(context);
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Align(
          child: Image(
              image: const AssetImage(Images.icCarrot),
              height: getScreenWidth(context) * 0.4,
              width: getScreenWidth(context) * 0.4),
        ),
      ),
    );
  }

  /// Create default categories and insert to database
  void generateDefaultCategories() {
    for (final category in Constants.defaultCategory) {
      categoryRepository.createCategory(category);
    }
  }

  void onBuildDone() {
    generateDefaultCategories();

    goToHomeScreen();
  }

  Future<void> goToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      await navigateTo(HomeScreen(), clearStack: true);
    });
  }
}
