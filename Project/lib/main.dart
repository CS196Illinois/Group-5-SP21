import 'package:flutter/material.dart';
import 'package:startup_namer/Favorites.dart';
import 'package:startup_namer/Homepage.dart';
import 'package:startup_namer/Song%20Generation.dart';

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
  final _biggerFont = const TextStyle(fontSize: 18);
  int _selectedIndex = 0;
  List<Widget> _options = <Widget>[
    Homepage(),
    SongGeneration(),
    Favorites()
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: _options.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // this will be set when a new tab is tapped
        onTap: _onTap,
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
}
