import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        "我是一个文本",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          // color: Colors.yellow,
          color: Color.fromRGBO(244, 233, 121, 0.5),
        ),
      ),
    )
  );
}