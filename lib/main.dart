import 'package:flutter/material.dart';
import './elements/Calculator_button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String history = '';
  String expression = '';
  // This widget is the root of your application.
  void numClick(String value) {
    setState(() {
      expression += value;
    });
  }

  void numClick_firstOps(String value) {
    setState(() {
      if (expression != ''){
        expression += value;
      }
    });
  }

  void PlusMinus(String value) {
    setState(() {
      // if (expression != null && expression.length > 0 && expression.substring(expression.length - 1) == '-') {
      //   expression = expression.substring(0, expression.length - 1);
      //   expression += '+';
      // }
      // else if (expression != null && expression.length > 0 && expression.substring(expression.length - 1) == '+') {
      //   expression = expression.substring(0, expression.length - 1);
      //   expression += '-';
      // }

      var string_rev = expression.split('');
      var num = 0;
      var new_string = '';
      if (string_rev.toString().contains("-") == false && string_rev.toString().contains("+") == false && string_rev.toString().contains("/") == false && string_rev.toString().contains("*") == false && string_rev.toString().contains("%") == false){
        new_string += '-${expression}';
        expression = new_string;
      }
      else {
        string_rev.reversed
            .join()
            .runes
            .forEach((var rune) {
          var character = new String.fromCharCode(rune);
          if (character == '-' || character == '+') {
            if (num == 1) {
              new_string += character;
            }
            while (num != 1) {
              if (character == '-') {
                new_string += '+';
              }
              else if (character == '+') {
                new_string += '-';
              }
              num = 1;
            }
          }
          else if (character != '-' || character != '+') {
            new_string += character;
          }
        });
        var final_string = new_string.split('');
        expression = final_string.reversed.join();
      }
    });
  }

  void clear(String value) {
    setState(() {
      history = '';
      expression = '';
    });
  }

  void evaluate(String value) {

    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      history = expression;
      expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF303030),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                history,
                style: new TextStyle(
                    fontSize: 24,
                    color: Colors.white.withOpacity(0.5)
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                expression,
                style: new TextStyle(
                  fontSize: 48,
                  color: Colors.white
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(height: 40),
            Row(
              children: <Widget>[Calculator_button(
                text: 'С',
                callback: clear,
                fillColor: 0xFF424242,
                textColor: 0xFFFFFFFF,
              ),
                Calculator_button(
                  text: '±',
                  callback: PlusMinus,
                  fillColor: 0xFF424242,
                  textColor: 0xFFFFFFFF,
                ),
                Calculator_button(
                  text: '%',
                  value: '%',
                  callback: numClick_firstOps,
                  fillColor: 0xFF424242,
                  textColor: 0xFFFFFFFF,
                ),
                Calculator_button(
                  text: '÷',
                  value: '/',
                  callback: numClick_firstOps,
                  fillColor: 0xFFFFA000,
                  textColor: 0xFFFFFFFF,
                ),
              ],
            ),
            Row(
              children: <Widget>[Calculator_button(
                text: '7',
                value: '7',
                callback: numClick,
                fillColor: 0xFF757575,
                textColor: 0xFFFFFFFF,
              ),
                Calculator_button(
                  text: '8',
                  value: '8',
                  callback: numClick,
                  fillColor: 0xFF757575,
                  textColor: 0xFFFFFFFF,
                ),
                Calculator_button(
                  text: '9',
                  value: '9',
                  callback: numClick,
                  fillColor: 0xFF757575,
                  textColor: 0xFFFFFFFF,
                ),
                Calculator_button(
                  text: '×',
                  value: '*',
                  callback: numClick_firstOps,
                  fillColor: 0xFFFFA000,
                  textColor: 0xFFFFFFFF,
                ),
              ],
            ),
            Row(
              children: <Widget>[Calculator_button(
                text: '4',
                value: '4',
                callback: numClick,
                fillColor: 0xFF757575,
                textColor: 0xFFFFFFFF,
              ),
                Calculator_button(
                  text: '5',
                  value: '5',
                  callback: numClick,
                  fillColor: 0xFF757575,
                  textColor: 0xFFFFFFFF,
                ),
                Calculator_button(
                  text: '6',
                  value: '6',
                  callback: numClick,
                  fillColor: 0xFF757575,
                  textColor: 0xFFFFFFFF,
                ),
                Calculator_button(
                  text: '-',
                  value: '-',
                  callback: numClick,
                  fillColor: 0xFFFFA000,
                  textColor: 0xFFFFFFFF,
                ),
              ],
            ),
            Row(
              children: <Widget>[Calculator_button(
                text: '1',
                value: '1',
                callback: numClick,
                fillColor: 0xFF757575,
                textColor: 0xFFFFFFFF,
              ),
                Calculator_button(
                  text: '2',
                  value: '2',
                  callback: numClick,
                  fillColor: 0xFF757575,
                  textColor: 0xFFFFFFFF,
                ),
                Calculator_button(
                  text: '3',
                  value: '3',
                  callback: numClick,
                  fillColor: 0xFF757575,
                  textColor: 0xFFFFFFFF,
                ),
                Calculator_button(
                  text: '+',
                  value: '+',
                  callback: numClick,
                  fillColor: 0xFFFFA000,
                  textColor: 0xFFFFFFFF,
                ),
              ],
            ),
            Row(
              children: <Widget>[Calculator_zero_button(
                text: '0',
                value: '0',
                callback: numClick,
                fillColor: 0xFF757575,
                textColor: 0xFFFFFFFF,
              ),
                Calculator_button(
                  text: '.',
                  value: '.',
                  callback: numClick,
                  fillColor: 0xFF757575,
                  textColor: 0xFFFFFFFF,
                ),
                Calculator_button(
                  text: '=',
                  value: '=',
                  callback: evaluate,
                  fillColor: 0xFFFFA000,
                  textColor: 0xFFFFFFFF,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}