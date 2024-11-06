// App0807.dart
// Generación dinámica de Widgets

import 'package:flutter/material.dart';
import 'App08Main.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  goToDetailPage(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(),
            settings: RouteSettings(
            arguments: index,
          )
        )
    );
  }

  Widget buildTitlePageCore() {
    return ListView(
      children: <Widget>[
        for(int index=0; index<=25; index++)
          ListTile(
            title: Text('Fast and Furious ${index + 1}'),
            onTap: () => goToDetailPage(index+1),
          ),
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    final sequelNumber = ModalRoute.of(context)?.settings.arguments as int;
    final overview =  'Fast and Furious $sequelNumber${getSuffix(sequelNumber)} is '
                      'More Faster and Furious than previous film.';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[Text(overview)],
    );
  }

  String getSuffix(int sequelNumber) {
    String suffix;
    switch(sequelNumber) {
      case 1:
      case 21:
        suffix = "st";
        break;
      case 2:
      case 22:
        suffix = "nd";
        break;
      case 3:
      case 23:
        suffix = "rd";
        break;
      default:
        suffix = "th";
    }
    return suffix;
  }
}





