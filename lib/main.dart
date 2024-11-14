import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    showPerformanceOverlay: true,
    home: Page1(),
  ));
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin {
  List<AnimationController> _controllers = [];

  @override
  void initState() {
    super.initState();
    // 여러 개의 AnimationController 생성
    for (int i = 0; i < 50; i++) {
      _controllers.add(AnimationController(
        duration: Duration(seconds: 2),
        vsync: this,
      )..forward());
    }
  }

  @override
  void dispose() {
    // 주석 처리로 인해 메모리 누수 발생
    // _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Page2(),
            ));
          },
          child: Text('Navigate to Page 2'),
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with TickerProviderStateMixin {
  List<AnimationController> _controllers = [];

  @override
  void initState() {
    super.initState();
    // 여러 개의 AnimationController 생성
    for (int i = 0; i < 50; i++) {
      _controllers.add(AnimationController(
        duration: Duration(seconds: 2),
        vsync: this,
      )..forward());
    }
  }

  @override
  void dispose() {
    // 주석 처리로 인해 메모리 누수 발생
    // _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Page3(),
            ));
          },
          child: Text('Navigate to Page 3'),
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> with TickerProviderStateMixin {
  List<AnimationController> _controllers = [];

  @override
  void initState() {
    super.initState();
    // 여러 개의 AnimationController 생성
    for (int i = 0; i < 50; i++) {
      _controllers.add(AnimationController(
        duration: Duration(seconds: 2),
        vsync: this,
      )..forward());
    }
  }

  @override
  void dispose() {
    // 주석 처리로 인해 메모리 누수 발생
    // _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 3')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Page1(),
            ));
          },
          child: Text('Navigate to Page 1'),
        ),
      ),
    );
  }
}
