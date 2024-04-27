import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar:
        AppBar(
          title: const Text(
            "你好，Flutter",
            key: Key("this key"),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            textScaler: TextScaler.linear(1.0),
            style: TextStyle(
              fontSize: 40,
              color: Color.fromARGB(211, 204, 237, 199),
              backgroundColor: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
          )
      ),
      body:
        const Center(
          child: Text(
            "我是一个文本",
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 40.0,
              // color: Colors.yellow,
              color: Color.fromRGBO(122, 233, 121, 0.5),
            ),
          ),
        ),
    ),
  ));
}