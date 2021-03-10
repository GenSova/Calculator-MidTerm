import 'package:flutter/material.dart';

class Calculator_button extends StatelessWidget {
  final String text;
  final String value;
  final int fillColor;
  final int textColor;
  final Function callback;
  const Calculator_button({
    Key key,
    this.text,
    this.value,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      child: SizedBox(
      width: 96,
      height: 86,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Text(
          text,
          style: new TextStyle(
            fontSize: 40
          ),
        ),
        onPressed: () {
          callback(value);
        },
        color: fillColor != null ? Color(fillColor) : null,
        textColor: Color(textColor),
      ),
    ),
    );
  }
}

class Calculator_zero_button extends StatelessWidget {
  final String text;
  final String value;
  final int fillColor;
  final int textColor;
  final Function callback;
  const Calculator_zero_button({
    Key key,
    this.text,
    this.value,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      child: SizedBox(
        width: 194,
        height: 86,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: Text(
            text,
            style: new TextStyle(
                fontSize: 40
            ),
          ),
          onPressed: () {
            callback(value);
          },
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
