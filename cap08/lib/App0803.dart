// App0803.dart

import 'package:flutter/material.dart';
import 'App08Main.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  static bool _isFavorite = true;

  gotoDetailPage() {
    Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => DetailPage(),
          settings: RouteSettings(arguments: _isFavorite),
        )
    );
  }
  
  Widget buildTitlePageCore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Being John Malkovich", textScaler: TextScaler.linear(1.5),),
        SizedBox(height: 16.0,),
        ElevatedButton.icon(onPressed: gotoDetailPage, label: Text("Details"), icon: Icon(Icons.movie_rounded),)
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(overview, textScaler: TextScaler.linear(1.5),),
        SizedBox(height: 30.0,),
        Visibility(child: Icon(Icons.favorite_rounded, size: 150, color: Colors.red,), visible: ModalRoute.of(context)?.settings.arguments as bool,)
      ],
    );
  }
}

