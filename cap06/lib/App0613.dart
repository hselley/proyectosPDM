// App0613.dart

import 'package:flutter/material.dart';
import 'App06Main.dart';

/*Widget buildColumn(context) {
  if(MediaQuery.of(context).size.width >= 500 ) {
    return _buildOneLargeRow();
  } else {
    return _buildTwoSmallRows();
  }
}*/

Widget buildColumn(context) {
  if(MediaQuery.of(context).orientation == Orientation.landscape) {
    return _buildOneLargeRow();
  } else {
    return _buildTwoSmallRows();
  }
}

Widget _buildOneLargeRow() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildRoundedBox("Aardvark"),
          buildRoundedBox("Baboon"),
          buildRoundedBox("Unicorn"),
          buildRoundedBox("Eel"),
          buildRoundedBox("Emu"),
          buildRoundedBox("Platypus"),
        ]
      ),
    ],
  );
}

Widget _buildTwoSmallRows() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildRoundedBox("Aardvark"),
          buildRoundedBox("Baboon"),
          buildRoundedBox("Unicorn"),
        ],
      ),
      SizedBox(height: 33.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildRoundedBox("Eel"),
          buildRoundedBox("Emu"),
          buildRoundedBox("Platypus"),
        ],
      )
    ],
  );
}