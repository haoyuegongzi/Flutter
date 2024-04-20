import 'package:flutter/material.dart';

// 这个主要是：控制浮动按钮的大小亦即精确控制他的位置。
main() {
  runApp(const MaterialApp(
      title: "带凸起效果按钮的底部导航bar",
      home: BottomNavigationBarAndFloat()));
}

class BottomNavigationBarAndFloat extends StatefulWidget {
  const BottomNavigationBarAndFloat({super.key});

  @override
  State<StatefulWidget> createState() {
    return BottomNavigationAndFloatButton();
  }
}

class BottomNavigationAndFloatButton
    extends State<BottomNavigationBarAndFloat> {
  int currenPosition = 0;
  // int fColor = Colors.yellow;

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
        body: const Center(
          child: Text("带凸起效果按钮的底部导航bar"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(color: Colors.blue, fontSize: 18),
          unselectedLabelStyle: const TextStyle(color: Colors.black45, fontSize: 12),
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          unselectedIconTheme: const IconThemeData(color: Colors.black26),
          backgroundColor: Colors.lightBlueAccent,
          // 控制Icon的尺寸大小
          iconSize: 18,
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
                  Icons.account_balance, color: Colors.black26,
                ),
                label: "首页", backgroundColor: Colors.blueGrey),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_chart, color: Colors.black26,
                ),
                label: "账单", backgroundColor: Colors.blueGrey),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_alarm_sharp, color: Colors.black26,
                ),
                label: "紧急事件", backgroundColor: Colors.blueGrey),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.ac_unit, color: Colors.black26,
                ),
                label: "冷饮", backgroundColor: Colors.blueGrey),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle, color: Colors.black26,
                ),
                label: "我的", backgroundColor: Colors.blueGrey)
          ],
        ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsetsDirectional.all(8),
        // 通过 floatingActionButtonLocation 属性，再配合下面的 margin，可以控制 Container 距离底部的距离。
        // 数字越大，距离底部越近。
        margin: const EdgeInsetsDirectional.only(top: 10),
        decoration: BoxDecoration(
            color: currenPosition == 3 ? Colors.lightBlue : Colors.yellow,
          borderRadius: BorderRadius.circular(30)
        ),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              // 点击浮动按钮时，让界面跳转到 指定界面。
              currenPosition = 3;
              // fColor = Colors.lightBlue as Colors;
            });
            print("这个浮动按钮有什么鸟用呢？");
          },
          child: const Icon(Icons.add_circle_outline),
        ),
      ),
      // 下面这个属性，用来控制 floatingActionButton 在界面上的位置。
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
