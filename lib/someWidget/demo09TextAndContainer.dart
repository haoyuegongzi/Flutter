
import 'package:flutter/material.dart';

main() {
  runApp(
      MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text("学习Flutter的Text组件"),
              ),
              body: const MyText(),
              // body: const MyTextView(),
            ),
    )
  );
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.purple,// 这里的color颜色不能同时与 BoxDecoration 中的 color 颜色同时使用。否则会有意外的错误
      // transform: Matrix4.skew(0.25, 0.25),
      width: 500,
      height: 500,
      padding: const EdgeInsetsDirectional.all(25),
      decoration: const BoxDecoration(
        color: Colors.green,
        // border: Border.all(),
        gradient: RadialGradient(
            colors:[
              Colors.black12, Colors.black87, Colors.lime, Colors.purple
            ]
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlueAccent,
            blurRadius: 15,
            blurStyle: BlurStyle.outer,
            spreadRadius: 20,
            offset: Offset.infinite
          )
        ],
      ),
      child: const Text(
          "Text组件的主题学习，不知道效果怎么样，运行起来看一看。",
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        textScaler: TextScaler.linear(0.8),
        textDirection: TextDirection.ltr,
        softWrap: true,
        maxLines: 3,
        style: TextStyle(
          color: Colors.yellowAccent,
          fontSize: 36,
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.1,
          wordSpacing: 1.25,
          overflow: TextOverflow.visible,
          // height: 360,// 这里的height不生效，而且会造成界面显示失败
          /**下面的四个属性用的比较少，不常用*/
          textBaseline: TextBaseline.alphabetic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          decorationStyle: TextDecorationStyle.dashed,
        ),
      ),
    );
  }
}

class MyTextView extends StatelessWidget {
  const MyTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      decoration: const BoxDecoration(
          color: Colors.yellow
      ),
      child: const Text(
        "你好我是Flutter你好我是Flutter你好我是Flutter你好我是Flutter你好我是Flutter",
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,   //溢出显示几个点
        maxLines: 1,
        style: TextStyle(
            fontSize: 20,
            fontWeight:FontWeight.w900,
            color: Colors.red,
            fontStyle:FontStyle.italic,
            letterSpacing:2,
            decoration:TextDecoration.underline,
            decorationColor: Colors.black,
            decorationStyle: TextDecorationStyle.dashed
        ),
      ),
    );
  }
}








