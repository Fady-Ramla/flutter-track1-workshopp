// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LighterScreen extends StatefulWidget {
  const LighterScreen({super.key});

  @override
  State<LighterScreen> createState() => _LighterScreenState();
}

class _LighterScreenState extends State<LighterScreen> {
  bool switcher = false;
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
      title: const Text("lighter"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lightbulb,
                  size: 100, color: switcher ? Colors.grey : Colors.orange),
              MaterialButton(
                onPressed: () {
                  setState(
                    () {
                      switcher = !switcher;
                    },
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  color: switcher ? Colors.red : Colors.green,
                  child: Text(
                    switcher ? "off" : "on",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
