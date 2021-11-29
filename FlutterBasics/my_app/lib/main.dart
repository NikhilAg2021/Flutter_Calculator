import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Basics'),
        centerTitle: true,
        backgroundColor: Colors.amber[500],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Hello World pt.1'),
          TextButton(
            onPressed: () {},
            child: Text('Click Me'),

          ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.cyan[400],
              child: Text('Hello World!!!'),
      ),
      ],
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.red[400],
            child: Text('One!!'),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.cyan[400],
            child: Text('two!!!'),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.amber[400],
            child: Text('Three!!!'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Text('Click'),
        backgroundColor: Colors.red,
      ),

    );
  }
}
