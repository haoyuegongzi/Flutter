import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title: const Text("你好，Flutter，后面是二货")
      ),
      body: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :super(key : key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
            color: Colors.cyan
        ),
        child: const Text(
          "你好，二货",
          style: TextStyle(
            fontSize: 28,
            fontStyle: FontStyle.italic
          ),
        ),
      ),
    );
  }
}








