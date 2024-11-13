import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> images = [
    'assets/image/image_1.png',
    'assets/image/image_2.png',
    'assets/image/image_3.png',
    'assets/image/image_4.png',
    'assets/image/image_5.png',
    'assets/image/image_6.png',
    'assets/image/image_7.png',
    'assets/image/image_8.png',
    'assets/image/image_9.png',
    'assets/image/image_10.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true, // 성능 오버레이 활성화

      home: Scaffold(
        body: ListView.builder(
          itemCount: images.length * 1000, // 많은 항목을 생성하여 메모리 사용 증가
          itemBuilder: (context, index) {
            int imageIndex = index % images.length;
            return Image.asset(
              images[imageIndex],
              // 최대 해상도로 이미지를 로드하여 메모리 사용량 증가
              width: double.infinity,
              height: 1000, // 큰 높이로 이미지 로드
              fit: BoxFit.fill,
              cacheHeight: null, // 캐싱 해상도를 제한하지 않음
              cacheWidth: null,
            );
          },
        ),
      ),
    );
  }
}
