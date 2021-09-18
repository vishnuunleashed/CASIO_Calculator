import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:studioproject/utility/button.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  var question = "";
  var answer = "0";
  int length;

  void equalPressed() {
    String finalQuestion = question;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }

  void processQuestion(String numOper) {

    question = question + numOper;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                SizedBox(height: 24),
                Container(
                  alignment: Alignment(-0.8, 0),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(color: Colors.black, width: 10),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    question == "" ? "0" : "$question",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.grey[200]),
                  ),
                ),
                Container(
                  alignment: Alignment(-0.8, 0),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(color: Colors.black, width: 10),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    "$answer",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.grey[200]),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
            child: Center(
                child: Text("CASIO",
                    style: TextStyle(
                        color: Colors.grey[100],
                        fontWeight: FontWeight.bold,
                        fontSize: 20))),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[100],
                border: Border.all(color: Colors.black, width: 10),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                          text: "CLR",
                          callback: () {
                            setState(() {

                              question = "0";
                              answer = "0";
                            });
                          }),
                      MyButton(
                        text: "DEL",
                        callback: () {
                          setState(() {
                            length = question.toString().length;
                            question = question.substring(0, length - 1);
                          });
                        },
                      ),
                      MyButton(
                        text: "%",
                        callback: () {
                          setState(() {
                            processQuestion("%");
                          });
                        },
                      ),
                      MyButton(
                        text: "/",
                        callback: () {
                          setState(() {
                            processQuestion("/");
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                          text: '7',
                          callback: () {
                            setState(() {
                              processQuestion("7");
                            });
                          }),
                      MyButton(
                          text: "8",
                          callback: () {
                            setState(() {
                              processQuestion("8");
                            });
                          }),
                      MyButton(
                          text: "9",
                          callback: () {
                            setState(() {
                              processQuestion("9");
                            });
                          }),
                      MyButton(
                        text: "*",
                        callback: () {
                          setState(() {
                            processQuestion("*");
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                          text: "4",
                          callback: () {
                            setState(() {
                              processQuestion("4");
                            });
                          }),
                      MyButton(
                          text: "5",
                          callback: () {
                            setState(() {
                              processQuestion("5");
                            });
                          }),
                      MyButton(
                          text: "6",
                          callback: () {
                            setState(() {
                              processQuestion("6");
                            });
                          }),
                      MyButton(
                        text: "-",
                        callback: () {
                          setState(() {
                            processQuestion("-");
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                          text: "1",
                          callback: () {
                            setState(() {
                              processQuestion("1");
                            });
                          }),
                      MyButton(
                          text: "2",
                          callback: () {
                            setState(() {
                              processQuestion("2");
                            });
                          }),
                      MyButton(
                          text: "3",
                          callback: () {
                            setState(() {
                              processQuestion("3");
                            });
                          }),
                      MyButton(
                        text: "+",
                        callback: () {
                          setState(() {
                            processQuestion("+");
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                          text: "0",
                          callback: () {
                            setState(() {
                              processQuestion("0");
                            });
                          }),
                      MyButton(
                          text: ".",
                          callback: () {
                            setState(() {
                              processQuestion(".");
                            });
                          }),
                      MyButton(
                        text: "=",
                        callback: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Center(
              child: Text("CREATED BY VPD",
                  style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 10)),
            ),
          ),
        ],
      ),
    );
  }
}
