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
      showPerformanceOverlay: true,
      home: Scaffold(

        body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return AnimatedImageWidget(imagePath: images[index]);
          },
        ),
      ),
    );
  }
}

class AnimatedImageWidget extends StatefulWidget {
  final String imagePath;

  const AnimatedImageWidget({Key? key, required this.imagePath}) : super(key: key);

  @override
  _AnimatedImageWidgetState createState() => _AnimatedImageWidgetState();
}

class _AnimatedImageWidgetState extends State<AnimatedImageWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _offsetAnimation = Tween<Offset>(begin: Offset(0, -0.1), end: Offset(0, 0)).animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward(); // 애니메이션 시작
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Image.asset(
            widget.imagePath,
            width: double.infinity,
            height: 300, // 적절한 높이 설정
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}