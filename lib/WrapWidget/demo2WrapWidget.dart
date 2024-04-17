

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
                fontFamily: "fontFamily啥作用的属性？"),
          ),
        ),
        body: const WrapWidget(),
      ),
    )
  );
}

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  List<Button2> createListWidget() {
    List<Button2> listWidget = [];
    for(var i = 0; i < 20; i++) {
      var str = "第 ${i + 1} 集";
      listWidget.add(Button2(str, onPressed: () {}));
    }
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      padding: const EdgeInsetsDirectional.all(8),
      margin: const EdgeInsetsDirectional.all(8),
      child: Wrap(
        // 控制列表是以:垂直方向优先排列（垂直方向一列满了，再换到下一列），还是水平方向优先排列（水平方向一行满了，再换到下一行）；
        direction: Axis.horizontal,
        // run的对齐方式。run可以理解为新的行或者列，如果是水平方向布局的话，run可以理解为新的一行
        runAlignment: WrapAlignment.spaceAround,
        crossAxisAlignment: WrapCrossAlignment.start,
        // 定义了children摆放顺序，默认是down，见Flex相关属性介绍。从 1 到 n，是从底部往上排，还是从顶部往下排
        verticalDirection: VerticalDirection.down,
        spacing: 55, // 控制 Item水平方向 / 方向 垂直的距离，取决于：direction
        // runSpacing: 55,// 控制 Item垂直方向 / 水平方向 的距离，取决于：direction
        children: createListWidget(),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  String text;
  void Function()? onPressed;

  Button2(this.text, {Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(const Color.fromARGB(255, 236, 233, 233)),
          foregroundColor: MaterialStateProperty.all(Colors.black45),
        ),
        child: Text(text),
      ),
    );
  }
}







