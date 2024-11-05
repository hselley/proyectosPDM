// App0805.dart

import 'package:flutter/material.dart';
import 'App08Main.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  static bool _isFavorite = false;

  goToDetailPage() async {
    _isFavorite = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(),
        settings: RouteSettings(arguments: _isFavorite)
      ),
    ) ?? _isFavorite;
    /// Actualización de la pantalla mediante un setState vacío
    setState(() {});
  }

  Widget buildTitlePageCore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Being John Malkovich", textScaler: TextScaler.linear(1.5),),
            Visibility(
              child: Icon(Icons.favorite_rounded, color: Colors.red, size: 100,),
              visible: _isFavorite ?? false,
            ),
          ],
        ),
        SizedBox(height: 16.0,),
        ElevatedButton.icon(
          onPressed: goToDetailPage,
          label: Text("Details"),
          icon: Icon(Icons.arrow_forward,),
        )
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    final _argument = ModalRoute.of(context)?.settings.arguments ?? false;
    final _isFavoriteArgument = _argument as bool;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(overview),
        SizedBox(height: 16.0,),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, !_isFavoriteArgument);
          },
          child: Text(
            _isFavoriteArgument ? 'Unfavorite this' : "Make it favorite"
          ),
        )
      ],
    );
  }
}