// App0904.dart

import 'package:flutter/material.dart';
import 'App09Main.dart';

extension MyHomePageStateExtension on MyHomePageState {
  Animation getAnimation(AnimationController controller) {
    return Tween<double>(begin: 50.0, end: 350.0).animate(controller)..addListener(() {
      setState(() {});
    });
  }

  Widget buildPositionedWidget() {
    int intValue = animation.value.toInt();
    return Center(
      child: Icon(
        Icons.android_rounded,
        size: animation.value,
        color: Color.fromRGBO(intValue, 0, 255-intValue, 1.0),
      ),
    );
  }
}