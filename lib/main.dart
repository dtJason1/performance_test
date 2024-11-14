import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AnimatedImagePage(),
  ));
}

class AnimatedImagePage extends StatefulWidget {
  @override
  _AnimatedImagePageState createState() => _AnimatedImagePageState();
}

class _AnimatedImagePageState extends State<AnimatedImagePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // AnimationController 생성 및 반복 애니메이션
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // 확대 및 축소 애니메이션 설정
    _animation = Tween<double>(begin: 1.0, end: 2.0).animate(_controller);
  }

  @override
  void dispose() {
    // AnimationController 해제
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Images')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 10, // 10개의 이미지 사용
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value, // 애니메이션에 따라 이미지 확대/축소
                child: Image.asset(
                  'assets/image/image_$index.png',
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
