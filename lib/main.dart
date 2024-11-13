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
    'assets/image/image_1.png',
    'assets/image/image_2.png',
    'assets/image/image_3.jpg',
  ];

  int currentIndex = 0; // 현재 이미지 인덱스

  void _showNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length; // 다음 이미지로 이동, 리스트 끝에서 다시 처음으로
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 현재 인덱스의 이미지를 보여줌
                  Image.asset(
                    images[0],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[1],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[2],
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showNextImage,
                    child: Text('Show Next Image'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 현재 인덱스의 이미지를 보여줌
                  Image.asset(
                    images[0],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[1],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[2],
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showNextImage,
                    child: Text('Show Next Image'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 현재 인덱스의 이미지를 보여줌
                  Image.asset(
                    images[0],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[1],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[2],
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showNextImage,
                    child: Text('Show Next Image'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 현재 인덱스의 이미지를 보여줌
                  Image.asset(
                    images[0],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[1],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[2],
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showNextImage,
                    child: Text('Show Next Image'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 현재 인덱스의 이미지를 보여줌
                  Image.asset(
                    images[0],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[1],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[2],
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showNextImage,
                    child: Text('Show Next Image'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 현재 인덱스의 이미지를 보여줌
                  Image.asset(
                    images[0],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[1],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[2],
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showNextImage,
                    child: Text('Show Next Image'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 현재 인덱스의 이미지를 보여줌
                  Image.asset(
                    images[0],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[1],
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    images[2],
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showNextImage,
                    child: Text('Show Next Image'),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}