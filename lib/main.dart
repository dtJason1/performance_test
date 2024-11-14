import 'package:flutter/material.dart';

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
              builder: (context) => Page2(),
            ));
          },
          child: Text('Navigate to Page 2'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
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

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Page')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 10,
        itemBuilder: (context, index) {
          // 750x750 크기의 이미지 로드
          return Image.asset(
            'assets/image/image_$index.png',
            // cacheWidth, cacheHeight 속성 생략하여 메모리 사용량이 증가할 수 있음
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // 무한 네비게이션으로 인해 페이지가 계속 쌓일 수 있음
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Page1(),
          ));
        },
        child: Text('Navigate to Page 1'),
      ),
    );
  }
}
