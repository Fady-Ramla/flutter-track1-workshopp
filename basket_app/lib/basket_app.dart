// ignore_for_file: prefer_const_constructors
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BasketAppScreen extends StatefulWidget {
  const BasketAppScreen({super.key});

  @override
  State<BasketAppScreen> createState() => _BasketAppScreenState();
}

class _BasketAppScreenState extends State<BasketAppScreen> {
  int A = 0;
  int B = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: 
        AppBar(
      centerTitle: true,
      elevation: 20.0,
      backgroundColor: Colors.blueAccent,
      titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
      title: const Text("basketball"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 185,height: 480,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                     
                         Text(
                          "Team A",
                          style: TextStyle(fontSize: 38),
                        ),
                      Spacer(),
                      AutoSizeText(
                        "$A",maxLines: 1,minFontSize: 30,
                        style: TextStyle(
                            fontSize: 150, fontWeight: FontWeight.bold),
                      ),Spacer(),
                      Container(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mybuttom(
                                txt: "Add 1 point",
                                onPressed: () {
                                  setState(() {
                                    A = A + 1;
                                  });
                                }),
                            mybuttom(
                                txt: "Add 2 point",
                                onPressed: () {
                                  setState(() {
                                    A = A + 2;
                                  });
                                }),
                            mybuttom(
                                txt: "Add 3 point",
                                onPressed: () {
                                  setState(() {
                                    A = A + 3;
                                  });
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 2, 
                  ),
                ),
                Container(width: 185,height: 480,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                     
                         Text(
                          "Team B",
                          style: TextStyle(fontSize: 38),
                        ),
                      Spacer(),
                      AutoSizeText(
                        "$B",maxLines: 1,minFontSize: 30,
                        style: TextStyle(
                            fontSize: 150, fontWeight: FontWeight.bold),
                      ),Spacer(),
                      Container(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mybuttom(
                                txt: "Add 1 point",
                                onPressed: () {
                                  setState(() {
                                    B = B + 1;
                                  });
                                }),
                            mybuttom(
                                txt: "Add 2 point",
                                onPressed: () {
                                  setState(() {
                                    B = B + 2;
                                  });
                                }),
                            mybuttom(
                                txt: "Add 3 point",
                                onPressed: () {
                                  setState(() {
                                    B = B + 3;
                                  });
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),Spacer(),
            mybuttom(
                txt: "Reset",
                onPressed: () {
                  setState(() {
                    B = 0;
                    A = 0;
                  });
                }),Spacer()
          ],
        ),
      ),
    );
  }

  MaterialButton mybuttom(
      {required String txt, required void Function() onPressed}) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        color: const Color.fromARGB(255, 0, 145, 255),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Text(
            txt,
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
