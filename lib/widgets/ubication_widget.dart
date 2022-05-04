import 'package:flutter/material.dart';

class UbicationText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  double height;
  FontWeight fontWeight;
  UbicationText(
      {Key key,
      this.color = const Color.fromARGB(255, 2, 0, 1),
      this.text,
      this.size = 15,
      this.height = 1.2,
      this.fontWeight = FontWeight.w400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontSize: size,
            height: height,
            fontWeight: fontWeight));
  }
}
