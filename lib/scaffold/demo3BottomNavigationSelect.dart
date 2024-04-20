import 'package:flutter/material.dart';
import 'package:learnflutterdemo/scaffold/demo3BillOrder.dart';
import 'package:learnflutterdemo/scaffold/demo3Emergency.dart';
import 'package:learnflutterdemo/scaffold/demo3HomePage.dart';
import 'package:learnflutterdemo/scaffold/demo3Mine.dart';

main() {
  runApp(MaterialApp(
    title: "有选择状态的导航bar",
    theme: ThemeData(primarySwatch: Colors.cyan),
    home: const HomeTab(),
  ));
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return CreateHomeTab();
  }
}

class CreateHomeTab extends State<HomeTab> {
  // 这里设置默认选中哪一个 Item
  int currenPosition = 0;
  final List<Widget> widgetList = const[
    HomePageWidget(), BillOerder(),
    Emergency(), MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "有选择状态的导航bar",
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
        ),
      ),
      body: widgetList[currenPosition],
      // index
      // 注意：当 BottomNavigationBar 里面的 子BottomNavigationBarItem 数量超过 3个 的时候, 会出现背景色变白，文字消失的问题。
      // 我们需要将 BottomNavigationBar的 type属性 特别设置为 BottomNavigationBarType.fixed，item才会显示正常。
      // 但Item数量在3个及以下时，设置该属性，会运行失败。
      // type属性默认是 BottomNavigationBarType.shifting。
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.blue,
        // unselectedItemColor: Colors.black26,
        selectedLabelStyle: const TextStyle(color: Colors.blue, fontSize: 32),
        unselectedLabelStyle: const TextStyle(color: Colors.black45, fontSize: 24),
        selectedIconTheme: const IconThemeData(
          color: Colors.blue
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.black26
        ),
        backgroundColor: Colors.lightBlueAccent,
        iconSize: 36,
        // 下面几行是实现 底部导航栏 实现 点击选中 效果的关键；
        currentIndex: currenPosition,
        onTap: (index) {
          setState(() {
            currenPosition = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance,
                color: Colors.black26,
              ),
              label: "首页",
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_chart,
                color: Colors.black26,
              ),
              label: "账单",
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_alarm_sharp,
                color: Colors.black26,
              ),
              label: "紧急事件",
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black26,
              ),
              label: "我的",
              backgroundColor: Colors.blueGrey)
        ],
      ),
    );
  }
}
