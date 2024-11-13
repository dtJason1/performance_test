import 'package:flutter/material.dart';
import 'dart:typed_data';

void main() {

  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _scrollController = ScrollController();
  double scrollOffset = 0;

  final List<String> images = [
    'assets/image/image_1.png',
    'assets/image/image_2.png',
    'assets/image/image_3.png',
    'assets/image/image_4.png',
    'assets/image/image_5.png',
    'assets/image/image_6.png',
    'assets/image/image_7.png',
    'assets/image/image_8.png',
    'assets/image/image_9.png',
    'assets/image/image_10.png',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scroll Animation Example'),
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: images.length,
          itemBuilder: (context, index) {
            double animationValue = ((scrollOffset - (index * 300)) / 300).clamp(0.0, 1.0);
            double opacity = animationValue;
            double translateY = (1 - animationValue) * -10;

            return AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(0, translateY),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset(
                    images[index],
                    width: double.infinity,
                    height: 700, // 적절한 높이로 설정
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}