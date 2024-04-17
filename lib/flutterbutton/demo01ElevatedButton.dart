
import 'package:flutter/material.dart';

// 普通按钮, 凸起按钮
main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "ElevatedButton按钮特性",
            style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontStyle: FontStyle.italic,
                fontFamily: "fontFamily啥作用的属性？"
            ),
          ),
        ),
        body: const ElevatedButtonWidget(),
      ),
    )
  );
}

// 普通按钮，凸起按钮
class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print(
            "会打印出个什么鬼东西？",
        );
      },
      child: const Text(
          "这是个普通按钮",
        style: TextStyle(
          color: Colors.red
        ),
      ),
    );
  }
}




















