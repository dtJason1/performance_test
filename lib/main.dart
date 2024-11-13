// import 'package:flutter/material.dart';
// import 'dart:typed_data';
//
// void main() {
//
//   runApp(MyApp());
// }
//
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   ScrollController _scrollController = ScrollController();
//
//   final List<String> images = [
//     'assets/image/image_1.jpg',
//     'assets/image/image_2.png',
//     'assets/image/image_3.png',
//     'assets/image/image_4.jpg',
//     'assets/image/image_5.png',
//     'assets/image/image_6.png',
//     'assets/image/image_7.png',
//     'assets/image/image_8.png',
//     'assets/image/image_9.jpg',
//     'assets/image/image_10.png',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       showPerformanceOverlay: true,
//       home: Scaffold(
//
//         body: ListView.builder(
//           itemCount: images.length *1000,
//           itemBuilder: (context, index) {
//             return AnimatedImageWidget(imagePath: images[index%10]);
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class AnimatedImageWidget extends StatefulWidget {
//   final String imagePath;
//
//   const AnimatedImageWidget({Key? key, required this.imagePath}) : super(key: key);
//
//   @override
//   _AnimatedImageWidgetState createState() => _AnimatedImageWidgetState();
// }
//
// class _AnimatedImageWidgetState extends State<AnimatedImageWidget> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacityAnimation;
//   late Animation<Offset> _offsetAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//
//     _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
//     _offsetAnimation = Tween<Offset>(begin: Offset(0, -0.1), end: Offset(0, 0)).animate(_controller);
//
//     _controller.repeat(); // 애니메이션 반복 시작
//
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _triggerAnimation() {
//     _controller.repeat(); // 애니메이션 반복 시작
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _triggerAnimation, // 이미지를 터치할 때 애니메이션 트리거
//       child: SlideTransition(
//         position: _offsetAnimation,
//         child: FadeTransition(
//           opacity: _opacityAnimation,
//           child: Container(
//             margin: EdgeInsets.symmetric(vertical: 10),
//             child: Image.asset(
//               widget.imagePath,
//               width: double.infinity,
//               height: 300, // 적절한 높이 설정
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:async';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Memory Leak Example'),
        ),
        body: MemoryLeakWidget(),
      ),
    );
  }
}

class MemoryLeakWidget extends StatefulWidget {
  @override
  _MemoryLeakWidgetState createState() => _MemoryLeakWidgetState();
}

class _MemoryLeakWidgetState extends State<MemoryLeakWidget> {
  List<String> _largeList = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // 메모리를 점진적으로 채우는 초기 메서드
    for (int i = 0; i < 10000000; i++) {
      _largeList.add('Item $i');
    }
  }

  void _startMemoryLeak() {
    // 주기적으로 메모리를 점유하도록 타이머 시작
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        print("strat memory");
        for (int i = 0; i < 100000000000; i++) {
          _largeList.add('Item $i');
        }      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(child: Text("memory leak example"),),
        ),
        ElevatedButton(
          onPressed: _startMemoryLeak,
          child: Text('Start Memory Leak'),
        ),
      ],
    );
  }
}