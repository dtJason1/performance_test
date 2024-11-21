import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
class MyCustomPainter extends CustomPainter {
  final ui.Image image;

  MyCustomPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..blendMode = BlendMode.overlay;


    canvas.drawImage(image,  Offset(0,0), Paint());

    canvas.drawImage(image, Offset(-image.width.toDouble()/2,0), paint);


    // canvas.drawRect(Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CustomPaintExample extends StatefulWidget {
  @override
  _CustomPaintExampleState createState() => _CustomPaintExampleState();
}

class _CustomPaintExampleState extends State<CustomPaintExample> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final ByteData data = await rootBundle.load('assets/image/image_4.jpg');
    final ui.Image image = await decodeImageFromList(data.buffer.asUint8List());
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomPaint with Image'),
      actions: [
        ElevatedButton(
          onPressed: () {
            // 잘못된 방식으로 무제한 push 발생 가능
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Page1()),
            );
          },
          child: Text('Push New Page1'),
        ),
      ],),
      body: _image == null
          ? CircularProgressIndicator()
          : CustomPaint(
        size: Size(300, 300),
        painter: MyCustomPainter(_image!),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: CustomPaintExample()));
