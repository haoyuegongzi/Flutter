import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Container组件与Align组件的搭配",
          style: TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
              fontStyle: FontStyle.italic,
              fontFamily: "fontFamily啥作用的属性？"),
        ),
      ),
      body: const ContainerAlign(),
    ),
  ));
}

class ContainerAlign extends StatelessWidget {
  const ContainerAlign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      // 下面是 Container的 alignment 属性来控制 child子组件的位置
      // alignment: AlignmentDirectional.centerEnd,
      // child: const Text("试试Container与Align的组合"),
      color: Colors.blueAccent,
      // 下面是 通过 Align 组件来控制 child子组件的位置
      child: const Align(
        // 这里，除了 通过 AlignmentDirectional.xxx的方式来控制 子组件 相对于 父组件 的位置外，
        // 我们还可以通过  Alignment(double a, double b) 的方式来控制 子组件 相对于 父组件 的位置
        // alignment: AlignmentDirectional.center,
        // -1: 位于 top 或者 left； 0: 位于 center中间；1：位于 bottom 或者 end；
        // 然后 数字在 -1 到 1 之间 变化，那么 子组件 相对于父组件 的位置就从 top 或者 left 向 bottom 或者 end 移动/变化。
        // 这里涉及到一个关于位置的算法：(Alignment.x * childWidth / 2 + childWidth / 2, Alignment.y * childHeight / 2 + childHeight / 2)
        alignment: Alignment(0.5, 0.5),
        child: Text("试试Container与Align的组合"),
      ),
      // 最后，如果是child子组件居于中心位置，我们还可以直接使用center组件：
      // child: const Center(
      //   child: Text("试试Container与Align的组合"),
      // ),
    );
  }
}




















































