// App0605-06.dart

import 'package:flutter/material.dart';
import 'App06Main.dart';

Widget buildColumn(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      buildTitleText(),
      const SizedBox(height: 20.0,),
      _buildCaptionedRow(),
      _buildCaptionedRow(),
      _buildCaptionedRow(),
    ],
  );
}

Widget _buildCaptionedRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _buildCaptionedItem("Cat", caption: "Meow"),
      _buildCaptionedItem("Dog", caption: "Woof"),
      _buildCaptionedItem("Ape", caption: "Chatter"),
    ],
  );
}

Widget _buildCaptionedItem(String label, {String caption = "sound"}) {
  return Column(
    children: <Widget>[
      buildRoundedBox(label),
      const SizedBox(height: 5.0,),
      Text(caption, textScaler: const TextScaler.linear(1.25),)
    ],
  );
}








