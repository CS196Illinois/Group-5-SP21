import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:startup_namer/Song%20Generation.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _saved()
    );
  }
  Widget _saved() {
    final tiles = favorite.map(
          (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          title: Column(children: [
            Text(
              'Favorites',
              style: TextStyle(fontSize: 36),
            ),
            Text(
                'Liked Songs',
                style: TextStyle(fontSize: 16)
            ),
          ],)
      ),
      body: ListView(children: divided),
    );
  }
}