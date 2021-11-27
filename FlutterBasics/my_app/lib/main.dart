import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text('Flutter Basics'),
      centerTitle: true,
    ),
    body: const Center(
      child: Text('Hello World !!!'),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {  },
      child: const Text('Click'),
    ),
  ),
));