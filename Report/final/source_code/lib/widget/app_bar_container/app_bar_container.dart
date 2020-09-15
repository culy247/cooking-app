import 'package:cooking/theme/colors.dart';
import 'package:cooking/widget/clipper/app_bar_clipper.dart';
import 'package:flutter/material.dart';

class AppBarContainer extends StatelessWidget {
  final Widget child;

  const AppBarContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarClipper(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: AppColors.primary,
        child: child,
      ),
    );
  }
}
