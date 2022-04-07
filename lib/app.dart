import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var rng = Random();
  var number = 0;
  late Timer _timer;
  int start = 101;

  @override
  void initState() {
    super.initState();
  }

  void stopTimer() {
    setState(() {
      _timer.cancel();
    });
  }

  void startTimer() {
    const oneSec = const Duration(microseconds: 300000);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            // start = rng.nextInt(20) + 73;
            start = rng.nextInt(20) + 101;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Timer test")),
      body: Column(
        children: <Widget>[
          Text("$start"),
          ElevatedButton(
            onPressed: () {
              startTimer();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shadowColor: Colors.transparent,
            ),
            child: Text("Start"),
          ),
          ElevatedButton(
            onPressed: () {
              stopTimer();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shadowColor: Colors.transparent,
            ),
            child: Text("Stop", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
