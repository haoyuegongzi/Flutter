import 'package:flutter/material.dart';

main() {
  runApp(SliverLayout());
}

class SliverLayout extends StatelessWidget {
  final String str = "qwertyuiopplkjhgfdsazxcvbnmqwertyuiopplkjhgfdsazxcvbnm";

  @override
  Widget build(BuildContext context) {
    List<Text> childrenText = createWidgetList(str);
    return SizedBox(
      width: double.infinity,
      height: 360,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        padding: EdgeInsets.zero,
        primary: false,
        physics: const ScrollPhysics(),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // textDirection: TextDirection.ltr,
          // verticalDirection: VerticalDirection.down,
          children: childrenText,
        ),
      ),
    );
  }

  List<Text> createWidgetList(String str) {
    TextStyle style0 = const TextStyle(
        backgroundColor: Colors.blueGrey,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w900,
        fontSize: 24,
        wordSpacing: 20,
        letterSpacing: 22,
        height: 2);
    TextStyle style1 = const TextStyle(
        backgroundColor: Colors.indigoAccent,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w300,
        fontSize: 32,
        wordSpacing: 20,
        letterSpacing: 22,
        height: 2);
    List<Text> textList = [];
    List<String> temp = str.split("");
    int size = temp.length;
    for (var i = 0; i < size; i++) {
      if (i % 2 == 0) {
        textList.add(Text(
          temp[i],
          textDirection: TextDirection.ltr,
          style: style0,
          textScaler: const TextScaler.linear(1.2),
        ));
      } else {
        textList.add(Text(
          temp[i],
          textDirection: TextDirection.ltr,
          style: style1,
          textScaler: const TextScaler.linear(1.2),
        ));
      }
    }

    return textList;
  }
}
