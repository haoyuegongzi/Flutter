// 在Flutter中自定义组件其实就是一个类，这个类需要继承StatelessWidget/StatefulWidget。
// StatelessWidget是无状态组件，状态不可变的widget
// StatefulWidget是有状态组件，持有的状态可能在widget生命周期改变。
// 通俗的讲：如果我们想改变页面中的数据的话这个时候就需要用到StatefulWidget
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "StatefulWidget有状态的组件",
          style: TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
              fontStyle: FontStyle.italic,
              fontFamily: "fontFamily啥作用的属性？"),
        ),
      ),
      body: const HomePage(),
    ),
  ));
}

// StatelessWidget 与 StatefulWidget 的自定义组件，最大区别就在下面：
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListPageState();
  }
}

// 自定义 StatefulWidget 组件时，需要先 定义一个 class A，extends 继承 StatefulWidget，
// 然后再定义一个 类 class B，extends 继承 State<A>，然后，接下来的工作就更 自定义 StatelesWidget差不多了。
class HomePageState extends State<HomePage> {
  int countNum = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.all(50),
            child: Text("$countNum",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          ElevatedButton(
              onPressed: () {
                // 没有外面的这层 setState(() {
                setState(() {
                  countNum++;
                });
              },
              child: const Text("增加"))
        ],
      ),
    );
  }
}

class ListPageState extends State<HomePage> {
  final List<String> list = [];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: ElevatedButton(
              onPressed: () {
                index++;
                setState(() {
                  list.add("第 $index 条数据");
                });
              },
              child: const Text("增加")),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: OutlinedButton(
              onPressed: () {
                setState(() {
                  list.removeAt(list.length - 1);
                });
              },
              child: const Text("减少一个")),
        ),
        Column(
          // 下面是List集合增加时，UI列表也随之增加的关键
          children: list.map((value) {
            return ListTile(
              title: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
