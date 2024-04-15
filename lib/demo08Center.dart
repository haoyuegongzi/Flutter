import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("學習Flutter")),
      body: const MyAppBody(),
    ),
  ));
}

class MyAppBody extends StatelessWidget {
  const MyAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 160,
        // margin 和 padding 这两个属性的理解，同Android。
        margin: const EdgeInsets.all(25), // 设置外边距
        // 设置外边距；L: left, T: top, R: right, B: bottom。指定四个方向的距离
        // margin: const EdgeInsets.fromLTRB(25, 10, 15, 20), // 设置外边距
        padding: const EdgeInsets.all(15),// 设置内边距
        // 设置内边距；L: left, T: top, R: right, B: bottom。指定四个方向的距离
        // padding: const EdgeInsets.fromLTRB(25, 50, 5, 15),// 设置内边距
        // 围绕 X、Y、Z 轴旋转 一个值的角度，一般是以当前View的左上角为原点旋转。
        // transform: Matrix4.rotationZ(-0.5),
        // transform: Matrix4.rotationY(-0.2),
        // transform: Matrix4.rotationX(0.2),
        // 沿着  X、Y、Z 轴 平移 一个值的距离
        // transform: Matrix4.translationValues(-340, 100, 0),
        // skew:缩放
        transform: Matrix4.skew(0.1, 0),
        // alignment: Alignment.center,//内容居中，
        alignment: Alignment.bottomRight,//底部靠右。里面还有许多其他定义位置的属性
        decoration: BoxDecoration(// 设置边框及背景色等属性
          color: Colors.blueGrey,// 设置box盒子背景色
          border: Border.all(
            color: Colors.lightBlueAccent,// 设置边框颜色
            width: 5// 设置边框宽度
          ),
          // 当这里的radius半径是宽高的一半时，显示为一个圆
          borderRadius: BorderRadius.circular(10),//给边框设置圆角
          // 配置 BoxDecoration 内的颜色渐变效果
          // gradient: const LinearGradient(colors: [ // 线性渐变
          //   Colors.black12, Colors.black87, Colors.lime, Colors.purple
          // ]),
          // gradient: const SweepGradient(colors: [  // 雷达扫描状的渐变
          //   Colors.black12, Colors.black87, Colors.lime, Colors.purple
          // ]),
          gradient: const RadialGradient(colors: [ // 水波纹状的渐变
            Colors.black12, Colors.black87, Colors.lime, Colors.purple
          ]),
          // 设置阴影
          boxShadow: const[
            BoxShadow(
              color: Colors.orange,// 阴影颜色
              blurRadius: 55,//渐变阴影 最外围的圆角
              spreadRadius: 15,
              blurStyle: BlurStyle.solid,//在 spreadRadius 的范围内，阴影保持填充状态，不渐变
              // blurStyle: BlurStyle.normal, // 常规,相当于没有该参数
              // blurStyle: BlurStyle.inner, // 阴影在 spreadRadius 的范围内，处于填充状态,没有渐变效果
              // blurStyle: BlurStyle.outer, // 相当于没有该参数
            )
          ],
        ),
        child: const Text(
          "容器里面的文本",
          style: TextStyle(
            color: Colors.green,// 文本颜色
          ),
        ),
      ),
    );
  }
}















