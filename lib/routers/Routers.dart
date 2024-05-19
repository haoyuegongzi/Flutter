import 'package:flutter/material.dart';
import 'package:learnflutterdemo/routers/BillOrder.dart';
import 'package:learnflutterdemo/routers/Emergency.dart';
import 'package:learnflutterdemo/routers/HomePage.dart';
import 'package:learnflutterdemo/routers/Mine.dart';

// routers: 路由，通俗的将，就是界面跳转，就像 Android中的 startActivity，或者 Fragment 切换；
// 在Flutter中通过 Navigator组件 管理路由导航。并提供了管理堆栈的方法。如：Navigator.push和Navigator.pop。
// Flutter中给我们提供了两种配置路由跳转的方式：
//                  1、基本路由 2、命名路由
main() {
  runApp(MaterialApp(
    title: "有选择状态的导航bar",
    debugShowCheckedModeBanner: false,
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

  final List<BottomNavigationBarItem> bottomNavigationList = const[
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
        selectedLabelStyle: const TextStyle(color: Colors.blue, fontSize: 16),
        unselectedLabelStyle: const TextStyle(color: Colors.black45, fontSize: 13),
        selectedIconTheme: const IconThemeData(
          color: Colors.blue
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.black26
        ),
        backgroundColor: Colors.black12,
        iconSize: 18,
        // 下面几行是实现 底部导航栏 实现 点击选中 效果的关键；
        currentIndex: currenPosition,
        onTap: (index) {
          setState(() {
            currenPosition = index;
          });
        },
        items: bottomNavigationList,
      ),
    );
  }
}
