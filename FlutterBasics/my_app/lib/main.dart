import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basics'),
        centerTitle: true,
        backgroundColor: Colors.amber[500],
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            print("Icon Clicked ");
          },
          icon: Icon(Icons.mail),
          color: Colors.amber,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Text('Click'),
        backgroundColor: Colors.red[300],
      ),
    );
  }
}
