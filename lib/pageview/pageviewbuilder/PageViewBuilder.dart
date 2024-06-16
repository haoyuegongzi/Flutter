import 'package:flutter/material.dart';
import 'package:learnflutterdemo/pageview/viewpager/PageIndicator.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterViewPagerBuilder(),
      title: "Page轮播",
    )
  );
}

// Flutter 中的 PageView，跟 Android 中的 ViewPager完全是一回事；

// PageView 的几个常用属性：
// scrollDirection： Axis.horizonta水平方向； Axis.vertical锤子方向
// children： 配置子元素
// allowImplicitScrolling： 缓存当前页面的前后两页
// onPageChanged： page改变的时候触发，也就是回调；相当于Android的 ViewPager2 的 ViewPager2.OnPageChangeCallback 接口
class FlutterViewPagerBuilder extends StatefulWidget {
  FlutterViewPagerBuilder({super.key});

  int pageCount = 10;

  @override
  State<StatefulWidget> createState() {
    return FlutterPageView();
  }
}

class FlutterPageView extends State<FlutterViewPagerBuilder> {
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
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
          pageSnapping: true,
          allowImplicitScrolling: true,
          itemCount: widget.pageCount,
          itemBuilder: (context, index) {
            // 真正实战开发中，我们可以用某个 自定义的具备特定功能的Widget 来替代这个Center Widget
            return Center(
              child: Text(
                "第${index + 1}页",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            );
          }
      ),
    );
  }
}



