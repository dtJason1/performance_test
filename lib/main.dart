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

class _Page1State extends State<Page1> {
  List<Image> _images = []; // 이미지 리스트를 저장하는 변수

  @override
  void initState() {
    super.initState();
    // 여러 Image 위젯 생성 및 리스트에 추가 (navigate 시 문제가 발생하도록 설정)
    for (int i = 0; i < 10; i++) {
      _images.add(Image.asset("assets/image/helloo.gif"));
    }
  }

  @override
  void dispose() {
    // 메모리 누수 방지를 위한 코드가 없는 상태
    _images.clear(); // 이미지 리스트 비우기(해제) 코드가 누락됨
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return _images[index]; // 생성된 이미지를 반환
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // 잘못된 방식으로 무제한 push 발생 가능
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Page1()),
              );
            },
            child: Text('Push New Page1'),
          ),
        ],
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
      )..repeat());
    }
  }

  @override
  void dispose() {
    // 주석 처리로 인해 메모리 누수 발생
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/image/helloo.gif"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Page3(),
                ));
              },
              child: Text('Navigate to Page 3'),
            ),
          ],
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
      )..repeat());
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
        child: Column(
          children: [
            Image.asset("assets/image/helloo.gif"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Page1(),
                ));
              },
              child: Text('Navigate to Page 1'),
            ),
          ],
        ),
      ),
    );
  }
}
