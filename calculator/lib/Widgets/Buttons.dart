import 'package:flutter/material.dart';

class Calculator_Buttons extends StatelessWidget {
  final String text;
  // final int fillColor;
  // final int textColor;
  // final double textSize;
  // final Function callback;

  const Calculator_Buttons({
    required this.text,
    // required this.fillColor,
    // required this.textColor,
    // required this.textSize,
    // required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.orangeAccent,
              shadowColor: Colors.black,
              elevation: 10),
          child: Text(
            text,
             style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
             ),
          ),
          onPressed: () => {},
      ),
    ),
    );
}
  }