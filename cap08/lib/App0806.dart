// App0806.dart
// Versión de la aplicación con navegación mediante rutas nombradas

import 'package:flutter/material.dart';

void main() => runApp(App0806());

class App0806 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => MovieTitlePage(),
        "/details": (context) => DetailPage(),
        "/details/cast": (context) => CastPage(),
        "/details/reviews": (context) => ReviewsPage(),
      },
      initialRoute: '/details/reviews',
    );
  }
}

class MovieTitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _easyScaffold(
      appBarTitle: 'Movie Title Page',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_easyButton(
          context: context,
          label: 'Go to Detail Page',
          whichRoute: '/details',
        ),],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _easyScaffold(
      appBarTitle: 'Detail Page',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: <Widget>[
              _easyButton(
                context: context,
                label: 'Go to Cast Page',
                whichRoute: '/details/cast',
              ),
              _easyButton(
                context: context,
                label: 'Go to Reviews Page',
                whichRoute: '/details/reviews',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _easyScaffold(
      appBarTitle: 'Cast Page',
      body: Container(),
    );
  }
}

class ReviewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _easyScaffold(
      appBarTitle: 'Reviews Page',
      body: Container(),
    );
  }
}

Widget _easyScaffold({required String appBarTitle, required Widget body}) {
  return Scaffold(
    appBar: AppBar(title: Text(appBarTitle)),
    body: body,
  );
}

Widget _easyButton({required BuildContext context, required String label, required String whichRoute}) {
  return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, whichRoute);
      },
      child: Text(label)
  );
}