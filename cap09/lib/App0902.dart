// App0902.dart

import 'package:flutter/material.dart';
import 'App09Main.dart';

extension MyHomePageStateExtension on MyHomePageState {
  Animation getAnimation(AnimationController controller) {
    Tween tween = Tween<double>(begin: 10.0, end: 600.0);
    Animation animation = tween.animate(controller);
    animation.addListener(() {
     setState(() {});
    });
    return animation;
  }

  Widget buildPositionedWidget() {
    return Positioned(
        left: 130.0,
        top: animation.value,
        child: Icon(Icons.pets, size: 120.0,)
    );
  }
}