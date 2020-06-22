import 'package:cooking/theme/images.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  final double width;
  final double height;

  const Loader({Key key, this.width, this.height}) : super(key: key);

  createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _opacity;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _opacity = CurvedAnimation(
      curve: Curves.easeInOutCubic,
      parent: _controller,
    );
  }

  @override
  Widget build(ctx) {
    return FadeTransition(
      child: Center(
        child: Image.asset(
          Images.icAdd,
          width: widget.width ?? getScreenWidth(context) / 10,
          height: widget.height ?? getScreenWidth(context) / 10,
        ),
      ),
      opacity: _opacity,
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}