import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FrequentSetStatePage(),
    );
  }
}

class FrequentSetStatePage extends StatefulWidget {
  @override
  _FrequentSetStatePageState createState() => _FrequentSetStatePageState();
}

class _FrequentSetStatePageState extends State<FrequentSetStatePage> {
  int _counter = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // 10ms마다 setState()를 호출하는 타이머
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Frequent setState Example')),
      body: Center(
        child: Text(
          'Counter: $_counter',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
