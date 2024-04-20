import 'package:flutter/material.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("这个浮动按钮有什么鸟用呢？");
        },
        child: const Icon(Icons.add_circle_outline),
      ),
      // 下面这个属性，用来控制 floatingActionButton 在界面上的位置。
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
