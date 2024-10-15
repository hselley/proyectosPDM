// App0612.dart

import 'package:flutter/material.dart';
import 'App06Main.dart';

Widget buildColumn(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
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
      _buildExpandedBox("Moose", flex: 0),
      _buildExpandedBox("Squirrel", flex: 50),
      _buildExpandedBox("Dinosaur", flex: 500),
    ],
  );
}

Widget _buildExpandedBox(String label, {height = 88.0, flex = 0}) {
  return Expanded(
    flex: flex,
    child: buildRoundedBox(label, height: height),
  );
}