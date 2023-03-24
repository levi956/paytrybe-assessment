import 'package:flutter/material.dart';

const appPadding = EdgeInsets.symmetric(horizontal: 20);

class XBox extends StatelessWidget {
  const XBox(this._width, {super.key});

  final double _width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
    );
  }
}

class YBox extends StatelessWidget {
  const YBox(this._height, {super.key});

  final double _height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
    );
  }
}
