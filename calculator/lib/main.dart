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
  late int firstNum,secondNum;
  late String history='',textToDisplay='',res,operation;

  void btnOnClick(String btnVal)
  {
    print(btnVal);
    if(btnVal== 'C')
    {
      textToDisplay='';
      firstNum=0;
      secondNum=0;
      res='';
    }
    else if(btnVal == 'AC')
    {
      textToDisplay='';
      firstNum=0;
      secondNum=0;
      res='';
      history='';

    }
    else if(btnVal=='+/-')
      {
        if(textToDisplay[0]!='-')
          {
            res='-'+textToDisplay;
          }
        else{
          res=textToDisplay.substring(1);
        }
      }
    else if(btnVal =='+' || btnVal =='-' || btnVal =='*' || btnVal =='/' ||btnVal =='%')
      {
        firstNum=int.parse(textToDisplay);
        res='';
        operation=btnVal;
      }
    else if(btnVal=='=')
    {
      secondNum=int.parse(textToDisplay);
      if(operation == '+'){
        res=(firstNum+secondNum).toString();
        history=firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation == '-'){
        res=(firstNum-secondNum).toString();
        history=firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation == '*'){
        res=(firstNum*secondNum).toString();
        history=firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation == '/'){
        res=(firstNum/secondNum).toString();
        history=firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation == '%'){
        res=(firstNum%secondNum).toString();
        history=firstNum.toString() + operation.toString() + secondNum.toString();
      }
    }
    else
      {
      res=int.parse(textToDisplay + btnVal).toString();
    }
    setState(()
    {
      textToDisplay=res;
    });
  }

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
              Container(
                child: Padding(
                padding: EdgeInsets.all(12),
                  child: Text(
                    history,
                      style: TextStyle(
                      fontSize: 24,
                      color: Color(0x73000000),
                      )
                ),
              ),
                alignment: Alignment(1.0,1.0),
          ),

              Container(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    textToDisplay,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                  )
                  ),
                ),
                alignment: Alignment(1.0,1.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_Buttons(
                      text: 'AC',
                      fillColor: 0xFFFF9100,
                      textColor: 0xff000000,
                      textSize: 20,
                      callback: btnOnClick,
                  ),
                  Calculator_Buttons(
                    text: 'C',
                    fillColor: 0xFFFF9100 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '%',
                    fillColor: 0xFFFF9100 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '/',
                    fillColor: 0xFFFF9100 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_Buttons(
                    text: '7',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '8',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '9',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '*',
                    fillColor: 0xFFFF9100 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_Buttons(
                    text: '4',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '5',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '6',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '-',
                    fillColor: 0xFFFF9100 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_Buttons(
                    text: '1',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '2',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '3',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '+',
                    fillColor: 0xFFFF9100 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_Buttons(
                    text: '0',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '00',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '+/-',
                    fillColor: 0x8A000000 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                  Calculator_Buttons(
                    text: '=',
                    fillColor: 0xFFFF9100 ,
                    textColor: 0xff000000,
                    textSize: 20,
                    callback: btnOnClick,

                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }

}

