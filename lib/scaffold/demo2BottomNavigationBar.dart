import 'package:flutter/material.dart';

main() {
  runApp(
      const BottomNavigationWidget()
      // const MyApp()
      );
}

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "这里的Title",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blueGrey,
          backgroundColor: Colors.blueGrey,
          title: const Text(
            "底部导航栏",
            style: TextStyle(color: Colors.red, fontSize: 32),
          ),
        ),
        body: const Text("App的body部分"),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey,
          items: const [
            BottomNavigationBarItem(
                tooltip: "选运动",
                icon: Icon(Icons.home, color: Colors.blue),
                label: "运动",
            ),
            BottomNavigationBarItem(
                tooltip: "选甲虫",
                icon: Icon(Icons.home, color: Colors.black38),
                label: "甲虫",
            ),
            BottomNavigationBarItem(
                tooltip: "选急救",
                icon: Icon(Icons.home, color: Colors.black38),
                label: "急救",
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter App")),
        body: const Center(
          child: Text("我是一个文本"),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
        ]),
      ),
    );
  }
}
