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
      body: const StackPositionedWidget(),
    ),
  ));
}

// Stack: 就是堆叠的意思，一层一层德码起来;
// Stack组件一般 配合着 Align 或者 Positioned 组件 一起使用。
// Stack组件里面 嵌套 Positioned 或者 Align 组件。
class StackPositionedWidget extends StatelessWidget {
  const StackPositionedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: 400,
      height: 400,
      color: Colors.teal,
      margin: const EdgeInsetsDirectional.all(20),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          // Positioned 的 width宽度 和 height高度，不支持 double.infinity无限大；会报错，无法正常显示；
          // 那么，要想让 Positioned在 width宽度方向 或者 height高度方向铺满，实现方式：MediaQuery
          Positioned( // 起到相对于 父组件View 的定位。
              // Positioned 组件内部有7个参数，分别是：上、下、左、右；宽、高；以及 child。
              // 通过下面的 left + top 两个属性，让 Container 组件及其子组件 Text
              // 位于父布局Stack的左上角，距离左边距和顶部编剧均为20。
              // 在这里，Container 组件及其子组件 Text 大小为 自适应 文本 “SizedBox + Text” 的大小；
              // 如果是想让组件居于左侧底部（left-bottom），则是给 left+bottom 两个参数赋值；
              // // 居于左上角，详见 StackPositioned1.png
              // left: 20,
              // top: 20,
              // 居于右下角，详见 StackPositioned2.png
              left: 0,
              bottom: 10,
              // 这里，left:0 配合 width: size.width，完美实现了 Positioned-Container 组件水平方向铺满的 需求
              // 另外，对子组件View的 宽度/高度 有要求时，建议直接在 Positioned 上进行 宽度/高度 的控制、实现。
              // 详见图
              width: size.width,
              height: 50,
              child: Container(
                color: Colors.blueGrey,
                child: const Text("SizedBox + Text"),
              )),
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
            style: TextStyle(color: Colors.purple),
          ),
          const Text("这个是叠在上层的文本", style: TextStyle(color: Colors.black))
        ],
      ),
    );
  }
}
