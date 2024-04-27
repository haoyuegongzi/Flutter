// Stack 组件里面 嵌套 Align 组件

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
            "Stack 组件里面 嵌套 Align 组件",
        ),
      ),
      body: const StackAlignView(),
    ),
  ));
}


class StackAlignView extends StatelessWidget {
  const StackAlignView

  ({super.key});

  @override
  Widget build(BuildContext context) {
    // 这个效果还可以通过 Stack + Positioned组件来实现；
    return const Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text("收藏"),
        ),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Text("购买"),
        )
      ],
    );
  }
}
