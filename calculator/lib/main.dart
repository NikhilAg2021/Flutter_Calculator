import 'package:calculator/Widgets/Buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Calculator(),
));
class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => CalculatorState();
}
class CalculatorState extends State<Calculator>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title:Text('Calculator'),
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_Buttons(text: 'C'),
                  Calculator_Buttons(text: '<-'),
                  Calculator_Buttons(text: '%'),
                  Calculator_Buttons(text: '/'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_Buttons(text: '7'),
                  Calculator_Buttons(text: '8'),
                  Calculator_Buttons(text: '9'),
                  Calculator_Buttons(text: '*'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_Buttons(text: '4'),
                  Calculator_Buttons(text: '5'),
                  Calculator_Buttons(text: '6'),
                  Calculator_Buttons(text: '-'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_Buttons(text: '1'),
                  Calculator_Buttons(text: '2'),
                  Calculator_Buttons(text: '3'),
                  Calculator_Buttons(text: '+'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_Buttons(text: '00'),
                  Calculator_Buttons(text: '0'),
                  Calculator_Buttons(text: '.'),
                  Calculator_Buttons(text: '='),
                ],
              ),
            ],
          ),
        ),
      );
  }

}

