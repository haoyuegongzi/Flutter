import 'package:flutter/material.dart';

main() {
  runApp(
      MaterialApp(
    home: Scaffold(
      // appBar一般都是标题栏，标题栏最重要的特征就是：显示标题，因此 title 是必要的：
      appBar: AppBar(
        title: const Text(
          "学习Flutter",
          textAlign: TextAlign.start,
          textDirection: TextDirection.ltr,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          selectionColor: Color.fromARGB(28, 197, 238, 204),
          textScaleFactor: 1.5,
          softWrap: bool.hasEnvironment("晓宇二货"),
          textWidthBasis: TextWidthBasis.longestLine,
          style: TextStyle(
            color: Colors.purple,
            fontSize: 18,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.25,
            wordSpacing: 1.5
          ),
        ),
        toolbarHeight: 100,
        centerTitle: const bool.fromEnvironment("晓宇的光腿神器"),
      ),
      body: const Center(
        child: Text(
            "data",
          style: TextStyle(
            color: Colors.purple,
            fontSize: 36,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  ));
}



