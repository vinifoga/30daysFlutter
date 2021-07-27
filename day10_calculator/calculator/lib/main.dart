import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userQuestion,
                        style: GoogleFonts.montserrat(fontSize: 20),
                      )),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: GoogleFonts.montserrat(fontSize: 60),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      //Clear Button
                      if (index == 0) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = '';
                              userAnswer = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                        );

                        //Delete Button
                      } else if (index == 1) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userAnswer = userAnswer.substring(
                                  0, userAnswer.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                      // Equals Button
                      else if (index == buttons.length - 1) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.grey[600],
                          textColor: Colors.white,
                        );
                      }

                      // Plus Button
                      else if (buttons[index] == '+') {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userAnswer += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.deepOrange[300],
                          textColor: Colors.white,
                        );
                      }
                      //Numbers
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userAnswer += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.grey[600]
                            : Colors.white,
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                      );
                    })),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '+' || x == '-' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userAnswer;
    String question = finalQuestion;
    finalQuestion = finalQuestion.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      userAnswer = eval.toString();
      userQuestion = question + ' = ' + eval.toString();
    });
  }
}
