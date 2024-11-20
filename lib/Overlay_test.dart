import 'package:flutter/material.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    // double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: _width,
        // height: _height,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CustomPaint(
                painter: DrawCustomRect(112, 32, 0, 80, 0xFFFF8D8D),
              ),
              CustomPaint(
                painter: DrawCustomRect(96, 16, 0, 96, 0xFFFF5454),
              ),
              CustomPaint(
                painter: DrawCustomRect(80, 0, 0, 112, 0xFFFA2A2A),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawCustomRect extends CustomPainter {
  final double _left;
  final double _top;
  final double _right; //width
  final double _bottom; //height
  final int _color;

  DrawCustomRect(this._left, this._top, this._right, this._bottom, this._color);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      new Rect.fromLTRB(this._left, this._top, this._right, _bottom),
      new Paint()..color = new Color(_color),
    );
  }

  @override
  bool shouldRepaint(DrawCustomRect oldDelegate) {
    return false;
  }
}