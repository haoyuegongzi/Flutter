import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FlutterViewPager(),
    title: "Page轮播",
  ));
}

// Flutter 中的 PageView，跟 Android 中的 ViewPager完全是一回事；

// PageView 的几个常用属性：
// scrollDirection： Axis.horizonta水平方向； Axis.vertical锤子方向
// children： 配置子元素
// allowImplicitScrolling： 缓存当前页面的前后两页
// onPageChanged： page改变的时候触发，也就是回调；相当于Android的 ViewPager2 的 ViewPager2.OnPageChangeCallback 接口
class FlutterViewPager extends StatefulWidget {
  const FlutterViewPager({super.key});

  @override
  State<StatefulWidget> createState() => FlutterPageView();
}

class FlutterPageView extends State<FlutterViewPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PageView-轮播效果",
          style: TextStyle(
            fontSize: 24,
            color: Colors.deepPurple,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      // body: const ViewPagerDemo(),
      body: PageView(
        scrollDirection: Axis.vertical,// 默认是水平方向
        allowImplicitScrolling: true,
        children: [
          Center(
            child: Text(
              "第一页",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Center(
            child: Text(
              "第二页",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Center(
            child: Text(
              "第三页",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Center(
            child: Text(
              "第四页",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Center(
            child: Text(
              "第五页",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Center(
            child: Text(
              "第六页",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          )
        ],
      ),
    );
  }
}



