import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: Page1(),
  ));
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ImagePage(),
            ));
          },
          child: Text('Navigate to Image Page'),
        ),
      ),
    );
  }
}

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> with TickerProviderStateMixin {
  List<Timer> _timers = [];
  List<AnimationController> _controllers = [];

  @override
  void initState() {
    super.initState();

    // 여러 개의 Timer와 AnimationController 생성
    for (int i = 0; i < 100; i++) {
      Timer timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        print('Timer tick $i');
      });
      _timers.add(timer);

      AnimationController controller = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this,
      )..repeat();
      _controllers.add(controller);
    }
  }

  // dispose()에서 리소스를 해제하지 않음으로써 메모리 누수 유발
  @override
  void dispose() {
    // 주석 상태로 남겨서 의도적으로 메모리 누수 발생
    // _timers.forEach((timer) => timer.cancel());
    // _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Page')),
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) {
          // 큰 이미지 로드 (반복적이고 메모리 관리 없음)
          return Image.asset(
            'assets/image/image_${index%10}.png',
            // 메모리 최적화 속성 생략
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Page1(),
          ));
        },
        child: Text('Navigate to Page 1'),
      ),
    );
  }
}
