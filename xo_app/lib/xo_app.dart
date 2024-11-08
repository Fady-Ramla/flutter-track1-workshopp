import 'package:flutter/material.dart';

class XoApp extends StatefulWidget {
  const XoApp({super.key});

  @override
  State<XoApp> createState() => XoAppState();
}

class XoAppState extends State<XoApp> {
  int oScore = 0;
  int xScore = 0;
  bool switcher = true;
  List<String> displayElement = ["", "", "", "", "", "", "", "", ""];
  int filledboxes = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightBlue[50],
          appBar: _appbar(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: _body(),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [_resultsBanner(), _board(), _buttons()],
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      elevation: 20.0,
      backgroundColor: Colors.blueAccent,
      titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
      title: const Text("TIC TAC TOE"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Expanded _board() {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          _bordRow(indxstart: 0),
          _bordRow(indxstart: 3),
          _bordRow(last: true, indxstart: 6)
        ],
      ),
    );
  }

  Widget _bordRow({bool last = false, required int indxstart}) {
    return Row(
      children: [
        _boardBox(bottomboarder: !last, indx: indxstart),
        _boardBox(bottomboarder: !last, indx: indxstart + 1),
        _boardBox(endboarder: false, bottomboarder: !last, indx: indxstart + 2),
      ],
    );
  }

  Expanded _boardBox(
      {bool endboarder = true, bool bottomboarder = true, required int indx}) {
    return Expanded(
        child: InkWell(
      onTap: () {
        setState(() {
          if (displayElement[indx] == "") {
            displayElement[indx] = switcher ? "X" : "O";
            switcher = !switcher;
            filledboxes++;
            _checkWinner();
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(50),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: BorderDirectional(
            end: endboarder
                ? const BorderSide(color: Colors.orange, width: 4)
                : BorderSide.none,
            bottom: bottomboarder
                ? const BorderSide(color: Colors.orange, width: 4)
                : BorderSide.none,
          ),
        ),
        child: Text(
          displayElement[indx],
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: displayElement[indx] == 'O'
                ? const Color(0xff0B575B)
                : Colors.black,
          ),
        ),
      ),
    ));
  }

  Expanded _resultsBanner() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text("Player X",
                  style: TextStyle(color: Colors.red, fontSize: 30)),
              Text("$xScore",
                  style: const TextStyle(color: Colors.red, fontSize: 30)),
            ],
          ),
          Column(
            children: [
              const Text("Player O",
                  style: TextStyle(color: Colors.green, fontSize: 30)),
              Text("$oScore",
                  style: const TextStyle(color: Colors.green, fontSize: 30)),
            ],
          ),
        ],
      ),
    );
  }

  void _checkWinner() {
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      _showWinDialog(displayElement[3]);
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      _showWinDialog(displayElement[6]);
    }
    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      _showWinDialog(displayElement[1]);
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    }
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    } else if (filledboxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" " + winner + " \" is Winner!!!"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text("Play Again"),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Draw"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: const Text('Play Again'),
              )
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });
    filledboxes = 0;
  }

  void _clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });
    filledboxes = 0;
  }

  MaterialButton _restartButton() {
    return MaterialButton(
      onPressed: () {
        setState(() {
          _clearScoreBoard();
        });
      },
      child: Container(
        color: Colors.redAccent,
        padding: const EdgeInsets.all(10),
        child: const Text(
          "Restart",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }

  MaterialButton _againButton() {
    return MaterialButton(
      onPressed: () {
        setState(() {
          _clearBoard();
        });
      },
      child: Container(
        color: Colors.redAccent,
        padding: const EdgeInsets.all(10),
        child: const Text(
          "again",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_restartButton(), _againButton()],
    );
  }
}
