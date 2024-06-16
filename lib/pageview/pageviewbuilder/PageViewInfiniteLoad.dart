import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageViewInfiniteLoad(),
        title: "PageView滑动时无限加载",
      )
  );
}//

// 实现一个滑动时，无限加载的功能；
class PageViewInfiniteLoad extends StatefulWidget {
  PageViewInfiniteLoad({super.key});

  int pageCount = 10;

  @override
  State<StatefulWidget> createState() {
    return FlutterPageViewInfiniteLoad();
  }
}

class FlutterPageViewInfiniteLoad extends State<PageViewInfiniteLoad> {
  List<Widget> listWidget = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0; i <10; i++) {
      listWidget.add(
          Center(
            child: Text(
              "无限加载的 第 ${i+1} 页",
              // 这里这么用，会报 “ context ”找不到的异常；
              style: const TextStyle(
                fontSize: 16,
                color: Colors.purple
              ),
            )
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PageView滑动时无限加载",
          style: TextStyle(
            fontSize: 24,
            color: Colors.deepPurple,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: PageView(
        reverse: true,
        allowImplicitScrolling: true,
        scrollDirection: Axis.horizontal,
        children: listWidget,
        // onPageChanged 这个回调的参数，Flutter只是指定了数据类型，并没有给出参数的名称，这一点跟 Java 的接口回调不一样，
        // Java的接口回调是 既指定回调参数的类型，又指定了回调参数的名字；这里仅仅只是制定了回调参数类型，因此回调参数的名字，
        // 我们可以自定义，我们既可以写成 index，也可以写成 position，或者其他参数；
        onPageChanged: (position){
          print("position = $position");
          if (position + 2 == listWidget.length) {
            setState(() {
              for(var i = 0; i < 10; i++) {
                listWidget.add(
                  Center(
                      child: Text(
                        "无限加载的 第 ${i+1} 页",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.purple
                        ),
                      )
                  )
                );
              }
            });
          }
        },
      ),
    );
  }
}