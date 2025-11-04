// App0905.dart

import 'dart:math';

import 'package:flutter/material.dart';

import 'App09Main.dart';

extension MyHomePageStateExtension on MyHomePageState {
  Animation getAnimation(AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 400.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  Widget buildPositionedWidget() {
    double newValue = animation.value;
    return Positioned(
      left: 15 * sqrt(newValue),
      top: newValue,
      child: Icon(
        Icons.hot_tub,
        size: 70,
      ),
    );
  }
}
