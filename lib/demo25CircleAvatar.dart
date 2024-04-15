
import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "CircleAvatar实现一个圆形图片",
            style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontStyle: FontStyle.italic,
                fontFamily: "fontFamily啥作用的属性？"
            ),
          ),
        ),
        // body: const CircleAvatarWidget(),
        body: CircleAvatarRing(),
      ),
    )
  );
}

// CircleAvatar实现一个圆形图片, 基本上，CircleAvatar 不提供设置边框的属性。但是，可以将其包裹在具有更大半径和不同背景颜色的
// 不同 CircleAvatar 中，以创建类似于边框的内容。
class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.blueGrey,
      // 下面三个参数，可以各自单独使用，radius 与 maxRadius、minRadius两个参数不能共存；
      // maxRadius 和 maxRadius 可以恭听出现。
      // radius: 200,
      maxRadius: 250,
      minRadius: 150,
      foregroundImage: NetworkImage(
          "https://img2.baidu.com/it/u=1898128106,2722598876&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800"
      ),
    );
  }
}

class CircleAvatarRing extends StatelessWidget{
  const CircleAvatarRing({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 250,
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.lightGreen,
      child: CircleAvatar(
        radius: 180,
        backgroundColor: Colors.cyan,
        foregroundImage: NetworkImage(
            "https://img2.baidu.com/it/u=1898128106,2722598876&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800"
        ),
      ),
    );
  }
}