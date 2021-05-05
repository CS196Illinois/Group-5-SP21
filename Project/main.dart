import 'package:flutter/material.dart';

void main() {
  runApp(MemoryBeats());
}

class MemoryBeats extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MemoryBeatsState();
  }
}

class _MemoryBeatsState extends State<MemoryBeats> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('memorybeats'),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(1.0),
                child: RaisedButton(onPressed: () {}, child: Text('search')),
              ),
              Card(
                child: Column(children: <Widget>[
                  Image.asset('assets/homepage_background.png'),
                  Text('memorybeats')
                ]),
              ),
            ],
          )),
    );
  }
}
