import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

class calculator extends StatefulWidget {
  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String equation = "0";
  String result = "";
  String expression = "";
  double equationfontsize = 38.0;

  output() {
    Parser p = Parser();
    Expression exp = p.parse(equation);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      equation = eval.toString();
    });
  }

  buttonpressed(btntext) {
    setState(() {
      if (btntext == "AC") {
        equation = "0";
        result = "0";
      } else if (btntext == "⌫") {
        equation = equation.substring(0, equation.length - 1);
      } else {
        if (equation == "0") {
          equation = btntext;
        } else {
          equation = equation + btntext;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
              child: Text(
            "CALCULATOR",
            style: TextStyle(color: Colors.black),
          )),
          backgroundColor: Colors.amber,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          equation,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.blue, fontSize: equationfontsize),
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calculatebutton('AC', Colors.green, Colors.orange),
                  calculatebutton('⌫', Colors.green, Colors.orange),
                  calculatebutton('%', Colors.green, Colors.orange),
                  calculatebutton('/', Colors.green, Colors.orange)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calculatebutton('7', Colors.pink, Colors.black),
                  calculatebutton('8', Colors.pink, Colors.black),
                  calculatebutton('9', Colors.pink, Colors.black),
                  calculatebutton('x', Colors.green, Colors.orange)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calculatebutton('4', Colors.pink, Colors.black),
                  calculatebutton('5', Colors.pink, Colors.black),
                  calculatebutton('6', Colors.pink, Colors.black),
                  calculatebutton('-', Colors.green, Colors.orange)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calculatebutton('3', Colors.pink, Colors.black),
                  calculatebutton('2', Colors.pink, Colors.black),
                  calculatebutton('1', Colors.pink, Colors.black),
                  calculatebutton('+', Colors.green, Colors.orange)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                      padding: EdgeInsets.fromLTRB(30, 10, 115, 10),
                      onPressed: () {},
                      shape: StadiumBorder(),
                      color: Colors.green,
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                        ),
                      )),
                  calculatebutton('.', Colors.green, Colors.black),
                  ElevatedButton(
                    onPressed: output,
                    child: Text(
                      '=',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.orange,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(34)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }

  Widget calculatebutton(String btntext, Color btncolor, Color textcolor) {
    return Expanded(
        child: Container(
            child: RaisedButton(
      onPressed: () => buttonpressed(btntext),
      child: Text(
        btntext,
        style: TextStyle(fontSize: 35, color: textcolor),
      ),
      color: btncolor,
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
    )));
  }
}
