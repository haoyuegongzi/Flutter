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
        body: const IconButtonWidget(),
      ),
    )
  );
}

// IconButton 是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
// 特点：正常情况下，显示一个 Icon图标，当该组件获得焦点时，则显示一个 外圆轮廓，类似加载了圆形图标的圆形按钮；
class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        print("Icon按钮又是啥？");
      },
      icon: const Icon(
      Icons.account_circle
      )
    );
  }
}











