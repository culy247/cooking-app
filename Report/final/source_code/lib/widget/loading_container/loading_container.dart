import 'package:cooking/widget/loading_container/loading_indicator.dart';
import 'package:flutter/material.dart';

import '../../utils/ui_utils.dart';

class LoadingContainer extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final bool isLoading;
  final double bgOpacity;
  final double paddingBottom;

  const LoadingContainer(
      {@required this.child,
      this.backgroundColor,
      this.isLoading,
      this.paddingBottom,
      this.bgOpacity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        if (isLoading)
          Container(
              width: getScreenWidth(context),
              height: getScreenHeight(context),
              color:
                  backgroundColor ?? Colors.grey.withOpacity(bgOpacity ?? 0.7),
              child: Padding(
                padding: EdgeInsets.only(bottom: paddingBottom ?? 0.0),
                child: const Center(child: LoadingIndicator()),
              ))
        else
          Container()
      ],
    );
  }
}
