import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 사용자가 페이지를 이동할 때마다 새로운 컨트롤러 생성
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SecondPage(),
            ));
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 새로운 AnimationController 생성
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(); // 무한 반복 애니메이션
  }

  @override
  void dispose() {
    // 주석 처리된 상태로 누수 발생 예시 (의도적으로 dispose하지 않음)
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * 3.141592653589793,
              child: child,
            );
          },
          child: Icon(Icons.star, size: 100, color: Colors.blue),
        ),
      ),
    );
  }
}
