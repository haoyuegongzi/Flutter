import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "二货Flutter，似乎会JavaScript的人学起来更轻松的样子",
              textAlign:TextAlign.start,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.deepOrange,
                  backgroundColor: Color.fromARGB(122, 255, 255, 0),
                  fontStyle: FontStyle.normal,
                  fontSize: 24,
              ),
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.ellipsis,
              selectionColor: Colors.green,
            ),
            shadowColor: Colors.purple,
          ),
          // 一个项目很庞大，所有的都放在MaterialApp里面，结构就太复杂了，
          // 所以有必要对结构进行抽离，就像Android抽取抽象方法，公共方法一样。详情看demo6。
          body: const Center(
            child: Text(
              "这是Flutter的body",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.amber,
                backgroundColor: Color.fromARGB(0, 255, 0, 0),
                fontStyle: FontStyle.italic,
                fontSize: 24,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.lime,
                decorationStyle: TextDecorationStyle.dashed,
                decorationThickness: 1.1
              ),
            ),
          ),
        ),
      )
  );
}
