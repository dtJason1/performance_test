import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    showPerformanceOverlay: true,
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
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SecondPage(),
            ));
          },
          child: Text('Navigate to Second Page'),
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
    )..forward(); // 애니메이션 실행
  }

  @override
  void dispose() {
    // 잘못된 예: _controller.dispose()를 호출하지 않음으로써 누수를 유발
    // _controller.dispose(); // 이 주석이 해제되지 않으면 메모리 누수가 발생합니다.
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
            return Transform.scale(
              scale: _controller.value,
              child: child,
            );
          },
          child: Icon(Icons.star, size: 100, color: Colors.blue),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // 동일한 페이지로 다시 이동하여 새로운 AnimationController 생성
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SecondPage(),
          ));
        },
        child: Text('Push Again'),
      ),
    );
  }
}
