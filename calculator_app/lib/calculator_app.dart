import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String userAsk = '';
  
  String userAnswer = '';
  List<String> myBtn = [
    'AC',
    'Del',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'Ans',
    '='
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA36361),
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! User Ask
              Container(
                height: 120,
                alignment: Alignment.centerLeft,
                color: const Color(0xFFD3A29D),
                child: AutoSizeText(
                  userAsk,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 40),
                ),
              ),

              //! User Answer
              Container(
                height: 120,
                alignment: Alignment.centerRight,
                color: const Color(0xFFD3A29D),
                child: AutoSizeText(
                  userAnswer,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ],
          )),
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: myBtn.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  //! AC Button
                  if (myBtn[index] == 'AC') {
                    return Button(
                      btnColor: Colors.amber,
                      btnText: myBtn[index],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          userAsk = '';
                          userAnswer = '';
                          
                        });
                      },
                    );

                    // !Delete Button
                  } else if (myBtn[index] == 'Del') {
                    return Button(
                      btnColor: const Color(0xFFE8B298),
                      btnText: myBtn[index],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          if (userAsk.isNotEmpty) {
                            userAsk = userAsk.substring(0, userAsk.length - 1);

                          }
                        });
                      },
                    );

                    //!Sign Button
                  } else if (myBtn[index] == '%' ||
                      myBtn[index] == '÷' ||
                      myBtn[index] == 'x' ||
                      myBtn[index] == '-' ||
                      myBtn[index] == '+') {
                    return Button(
                      btnColor: const Color(0xFF9EABA2),
                      btnText: myBtn[index],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          userAsk += myBtn[index];
                        });
                      },
                    );

                    //!Equal Button
                  } else if (myBtn[index] == '=') {
                    return Button(
                      btnColor: const Color(0xFF9EABA2),
                      btnText: myBtn[index],
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          equal();
                        });
                      },
                    );

                    //!All Button
                  }
                  else if (myBtn[index] == 'Ans') {
                    return Button(
                      btnColor: const Color(0xFF9EABA2),
                      btnText: myBtn[index],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          userAsk += myBtn[index];
                          
                         
                        });
                      },
                    );

                    //!All Button
                  }
                   else {
                    return Button(
                      btnColor: const Color(0xFFBDD1C5),
                      btnText: myBtn[index],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          userAsk += myBtn[index];
                        });
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  void equal() {
    try {
      String finalAsk = userAsk;
      finalAsk = finalAsk.replaceAll('x', '*');
      finalAsk = finalAsk.replaceAll('÷', '/');
      Parser p = Parser();
      Expression exp = p.parse(finalAsk);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      userAnswer = eval.toString();
    } catch (e) {
      if (userAsk.endsWith('÷')) {
        userAnswer = 'ERROR';
      }
    }
  }
}

class Button extends StatelessWidget {
  final Color? btnColor;
  final String btnText;
  final Color? textColor;
  final void Function()? onPressed;
  const Button({
    super.key,
    required this.btnColor,
    required this.btnText,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: MaterialButton(
          color: btnColor,
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 32,
              color: textColor,
            ),
          )),
    );
  }
}
