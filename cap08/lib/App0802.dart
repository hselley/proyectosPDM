// App0802.dart

import 'package:flutter/material.dart';
import 'App08Main.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  gotoDetailPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage()));
  }

  Widget buildTitlePageCore() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Being Jonh Malkovich', textScaler: TextScaler.linear(1.5),),
        SizedBox(height: 18,),
        FilledButton.icon(onPressed: gotoDetailPage, label: Text("Details"), icon: Icon(Icons.movie))
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(overview)
      ],
    );
  }
}