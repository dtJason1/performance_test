import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
  _trackFrameTimings();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true, // 성능 오버레이 활성화

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

void _trackFrameTimings() {
  WidgetsBinding.instance.addTimingsCallback((List<FrameTiming> timings) {
    for (var timing in timings) {
      int totalDurationMs = timing.totalSpan.inMilliseconds;
      if (totalDurationMs > 16) { // 16ms 이상이면 jank 발생으로 간주
        print('Jank detected: Frame took ${totalDurationMs}ms');
      }
    }
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 이미지 파일 경로를 리스트로 정의
  List<String> images = [
    'assets/image/image_1.jpg',
    'assets/image/image_2.png',
    'assets/image/image_3.png',
    'assets/image/image_4.jpg',
    'assets/image/image_5.PNG',
    'assets/image/image_6.PNG',
    'assets/image/image_7.png',
    'assets/image/image_8.png',
    'assets/image/image_9.jpg',
    'assets/image/image_10.PNG',
    'assets/image/image_1.jpg',
    'assets/image/image_2.png',
    'assets/image/image_3.png',
    'assets/image/image_4.jpg',
    'assets/image/image_5.PNG',
    'assets/image/image_6.PNG',
    'assets/image/image_7.png',
    'assets/image/image_8.png',
    'assets/image/image_9.jpg',
    'assets/image/image_10.PNG',    'assets/image/image_1.jpg',
    'assets/image/image_2.png',
    'assets/image/image_3.png',
    'assets/image/image_4.jpg',
    'assets/image/image_5.PNG',
    'assets/image/image_6.PNG',
    'assets/image/image_7.png',
    'assets/image/image_8.png',
    'assets/image/image_9.jpg',
    'assets/image/image_10.PNG',
  ];

  int currentIndex = 0; // 현재 이미지 인덱스

  void _showNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length; // 다음 이미지로 이동, 리스트 끝에서 다시 처음으로
    });
  }

  @override
  Widget build(BuildContext context) {
    // precacheImage(AssetImage('assets/image/image_1.png'), context);
    // precacheImage(AssetImage('assets/image/image_2.png'), context);
    // precacheImage(AssetImage('assets/image/image_3.jpg'), context);

    return MaterialApp(
      home: Scaffold(

        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: images.map((imagePath) {
                return Image.asset(
                  imagePath,
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}