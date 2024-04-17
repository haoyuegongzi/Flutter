
// TextButton 即文本按钮，默认背景透明并不带阴影。按下后，会有背景色
import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "文本按钮",
            style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontStyle: FontStyle.italic,
                fontFamily: "fontFamily啥作用的属性？"
            ),
          ),
        ),
        body: const TextButtonWidget(),
      ),
    )
  );
}

// TextButton 文本按钮的特点：不做任何操作糊着设置时，只显示文本内容，当控件/组件获取到焦点时，就显示出两端圆角的按钮状态。
class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print("文本按钮，就如Android里面的TextView？");
      },
      child: const Text(
          "文本按钮，就如Android里面的TextView？",
      ),

    );
  }

}







