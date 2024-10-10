// App0605.dart

import 'package:flutter/material.dart';
import 'App06Main.dart';

Widget buildColumn(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      buildTitleText(),
      const SizedBox(height: 20.0,),
      _buildRowOfThree(),
    ],
  );
}

Widget _buildRowOfThree() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      buildRoundedBox("Cat"),
      buildRoundedBox("Dog"),
      buildRoundedBox("Ape"),
    ],
  );
}