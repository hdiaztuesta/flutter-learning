import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  final List<Color> colorList;
  final List<double> stopList;

  const VideoBackground({
    super.key,
    this.colorList = const [Colors.transparent, Colors.black87],
    this.stopList = const [0.0, 1.0],
  }) : assert(
         colorList.length == stopList.length,
         'colorList and stopList must have the same length',
       );

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorList,
            stops: stopList,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
