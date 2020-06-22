import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/images.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/loader.dart';
import 'package:flutter/material.dart';

class CircleProfileImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderWidth;
  final Color borderColor;
  final Color shadowColor;

  const CircleProfileImage(
      {Key key,
      @required this.imageUrl,
      this.width,
      this.height,
      this.borderWidth = 4,
      this.borderColor = Colors.white,
      this.shadowColor = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = getScreenWidth(context) * 0.35;

    return this.imageUrl != null
        ? Container(
            width: width ?? defaultSize,
            height: height ?? defaultSize,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary,
                  blurRadius: 10.0, // has the effect of softening the shadow
                  spreadRadius: 2.0, // has the effect of extending the shadow
                )
              ],
              border: Border.all(width: borderWidth, color: borderColor),
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: imageUrl,
                  placeholder: (context, url) => Loader(),
                  errorWidget: (context, url, error) =>
                      _buildLoadImageError(context, defaultSize)),
            ),
          )
        : Container(
            width: width ?? defaultSize,
            height: height ?? defaultSize,
            decoration: new BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(Images.icAdd),
          );
  }

  _buildLoadImageError(BuildContext context, double defaultSize) {
    return Container(
      width: width ?? defaultSize,
      height: height ?? defaultSize,
      decoration: new BoxDecoration(shape: BoxShape.circle),
      child: Image.asset(
        Images.icAdd,
        fit: BoxFit.cover,
        width: 20.0,
        height: 20.0,
      ),
    );
  }
}