// Stack: 表示堆的意思
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stack: 表示堆的意思",
          style: TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
              fontStyle: FontStyle.italic,
              fontFamily: "fontFamily啥作用的属性？"),
        ),
      ),
      body: const StackWidget(),
    ),
  ));
}

// Stack: 就是堆叠的意思，一层一层德码起来;
// Stack组件一般 配合着 Align 或者 Positioned 组件 一起使用。
class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      margin: const EdgeInsetsDirectional.all(20),
      // alignment: 配置所有子元素的显示位置, 有十多个选项。
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          const SizedBox(
            width: 320,
            height: 320,
            child: Text("SizedBox + Text"),
          ),
          Container(
            color: Colors.orange,
            width: 260,
            height: 260,
          ),
          Container(
            color: Colors.lightBlue,
            width: 200,
            height: 200,
          ),
          const Text(
              "通过这种方式实现文字重叠",
            maxLines: 2,
            style: TextStyle(
              color: Colors.purple
            ),
          ),
          const Text(
              "这个是叠在上层的文本",
              style: TextStyle(
                  color: Colors.black
              )
          )
        ],
      ),
    );
  }
}
