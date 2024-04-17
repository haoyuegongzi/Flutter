
// OutlineButton 默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影
// 跟 TextButton 按钮很相似，不同的是，他自带边框；
import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "OutlinedButton边框按钮是什么鬼",
            style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontStyle: FontStyle.italic,
                fontFamily: "fontFamily啥作用的属性？"
            ),
          ),
        ),
        body: const OutlineButtonWidget(),
      ),
    )
  );
}


class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed:() {
        print("边框按钮？");
      },
      child: const Text(
          "OutlinedButton边框按钮是什么鬼"
      ),
    );
  }
}





















