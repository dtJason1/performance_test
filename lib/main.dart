import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'another_scene.dart';
import 'package:leak_tracker/leak_tracker.dart';

void main() {

  runApp(MyApp());

}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _scrollController = ScrollController();

  final List<String> images = [
    'assets/image/image_1.jpg',
    'assets/image/image_2.png',
    'assets/image/image_3.png',
    'assets/image/image_4.jpg',
    'assets/image/image_5.png',
    'assets/image/image_6.png',
    'assets/image/image_7.png',
    'assets/image/image_8.png',
    'assets/image/image_9.jpg',
    'assets/image/image_10.png',
  ];

  @override
  void initState() {
    super.initState();
  }

  void onPressed(){

    Navigator.push(context,MaterialPageRoute(builder: (context)=> AnotherScene()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true,
      home: MyAPP(),
    );
  }
}


class MyAPP extends StatefulWidget{
  @override
  State<MyAPP> createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  Widget build(BuildContext context){

// List of image file paths
    List<String> initialImages = [
      'assets/image/image_1.jpg',
      'assets/image/image_2.png',
      'assets/image/image_3.png',
      'assets/image/image_4.jpg',
      'assets/image/image_5.png',
      'assets/image/image_6.png',
      'assets/image/image_7.png',
      'assets/image/image_8.png',
      'assets/image/image_9.jpg',
      'assets/image/image_10.png',
    ];
    final List<String> images = List.generate(1000, (index) => initialImages[index % 10] );

// Fill the beginning of the 'images' list with 'initialImages'
    for (int i = 0; i < initialImages.length; i++) {
      images[i] = initialImages[i];
    }

    @override
    void initState() {
      super.initState();
    }

    void onPressed(){

      Navigator.of(context).pushAndRemoveUntil(  MaterialPageRoute(builder: (context) => AnotherScene()),
            (Route<dynamic> route) => false,
      );
    }



    return Scaffold(

      body: Stack(
        children: [
          ListView.builder(
            itemCount: 10000,
            itemBuilder: (context, index) {
              return AnimatedImageWidget(imagePath: images[index%10]);
            },
          ),

          ElevatedButton(onPressed: onPressed, child: Text("MOVE"))


        ]
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
    _offsetAnimation =
        Tween<Offset>(begin: Offset(0, -0.1), end: Offset(0, 0)).animate(
            _controller);

    _controller.repeat(); // 애니메이션 반복 시작

  }

  void _triggerAnimation() {
    _controller.repeat(); // 애니메이션 반복 시작

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _triggerAnimation, // 이미지를 터치할 때 애니메이션 트리거
      child: SlideTransition(
        position: _offsetAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Image.asset(
              widget.imagePath,
              width: double.infinity,
              height: 1090, // 적절한 높이 설정
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
// }
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:ui' as ui;
// import 'dart:typed_data';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Memory Overflow Example'),
//         ),
//         body: MemoryOverflowWidget(),
//       ),
//     );
//   }
// }
//
// class MemoryOverflowWidget extends StatefulWidget {
//   @override
//   _MemoryOverflowWidgetState createState() => _MemoryOverflowWidgetState();
// }
//
// class _MemoryOverflowWidgetState extends State<MemoryOverflowWidget> {
//   List<Uint8List> _memoryHogs = [];
//
//   void _triggerMemoryOverflow() {
//     // 메모리를 빠르게 채우는 코드
//     setState(() {
//       _memoryHogs.add(Uint8List(1024 * 1024 * 1)); // 50MB 블록을 무한히 추가
//       print(_memoryHogs);
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: _triggerMemoryOverflow,
//         child: Text('Trigger Memory Overflow'),
//       ),
//     );
//   }
// }