import 'package:cooking/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final Color spinKitColor;

  const LoadingIndicator({this.spinKitColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDoubleBounce(
        duration: Duration(seconds: 1),
        color: spinKitColor ?? AppColors.primary,
      ),
    );
  }
}
