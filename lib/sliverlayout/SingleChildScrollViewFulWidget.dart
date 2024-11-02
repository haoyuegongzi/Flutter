import 'package:flutter/material.dart';

main() {
  runApp(const SliverRunApp());
}

class SliverRunApp extends StatelessWidget {
  const SliverRunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Flutter 滑动、滚动及监控",
      home: SliverLayout(),
    );
  }
}

class SliverLayout extends StatefulWidget {
  const SliverLayout({super.key});

  @override
  State<StatefulWidget> createState() => SliverLayoutListener();
}

class SliverLayoutListener extends State<SliverLayout> {

  final String str = "qwertyuiopplkjhgfdsazxcvbnmqwertyuiopplkjhgfdsazxcvbnm";
  final ScrollController scrollController = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      debugPrint("获取到的滑动偏移量, offset: ${scrollController.offset}, initialScrollOffset: ${scrollController.initialScrollOffset}");
      // 滑动偏移量小于100，则隐藏向上的 FloatingActionButton 按钮
      if (scrollController.offset < 100) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (scrollController.offset >= 100){
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  List<Text> createWidgetList() {
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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Scrollbar(
          child: ListView(
            controller: scrollController,
            children: createWidgetList(),
          ),
        ),
        // showToTopBtn 为false，表示隐藏 FloatingActionButton 按钮，因此这里 返回一个 null 对象
        floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
            child: const Icon(Icons.arrow_upward),
            onPressed: () {
              scrollController.jumpTo(0);//  列表滚动到指定的position
              // scrollController.animateTo();//  列表滚动到指定的position（但要添加动画亦即动画执行时间）
            }
        ),
      ),
    );
  }

}