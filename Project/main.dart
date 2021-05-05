import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MemoryBeats',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RandomSongs(),
    );
  }
}


class RandomSongs extends StatefulWidget {
  @override
  _RandomSongsState createState() => _RandomSongsState();
}

class _RandomSongsState extends State<RandomSongs> {
  final _suggestions = <WordPair>[];
  final _favorite = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Songs'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushFavorite),
        ],
      ),
      body: _buildSuggestions(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        onTap: ,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.search, color: Colors.black, size: 50),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: Colors.black, size: 50),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite_border, color: Colors.black, size: 50),
            label: "",
          )
        ],
      ),
    );
  }
  void _pushFavorite() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _favorite.map(
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
        },
      ),
    );
  }
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        // The itemBuilder callback is called once per suggested
        // word pairing, and places each suggestion into a ListTile
        // row. For even rows, the function adds a ListTile row for
        // the word pairing. For odd rows, the function adds a
        // Divider widget to visually separate the entries. Note that
        // the divider may be difficult to see on smaller devices.
        itemBuilder: (BuildContext _context, int i) {
          // Add a one-pixel-high divider widget before each row
          // in the ListView.
          if (i.isOdd) {
            return Divider();
          }

          // The syntax "i ~/ 2" divides i by 2 and returns an
          // integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings
          // in the ListView,minus the divider widgets.
          final int index = i ~/ 2;
          // If you've reached the end of the available word
          // pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _favorite.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(   // NEW from here...
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),                // ... to here.
      onTap: () {      // NEW lines from here...
        setState(() {
          if (alreadySaved) {
            _favorite.remove(pair);
          } else {
            _favorite.add(pair);
          }
        });
      },
    );
  }
}
