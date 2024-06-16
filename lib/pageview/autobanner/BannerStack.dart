import 'package:flutter/material.dart';
import 'dart:async';

class BannerStack extends StatefulWidget {
  int itemCount = 10000;
  double width = 240;
  double height = 500;

  List<Widget> list = [];

  BannerStack(
      {this.itemCount = 10000,
      this.width = double.infinity,
      this.height = 200,
      required this.list,
      super.key});

  @override
  State<BannerStack> createState() => BannerStackImpl();
}

class BannerStackImpl extends State<BannerStack> {
  // viewportFraction是一个缩放 pageview 的 page大小 的系数，即（假设是横向）：外层容器宽度 * viewportFraction。
  // pageController = PageController(initialPage: 0, keepPage: true, viewportFraction: 1.0);
  // duraction入参的作用：指定每隔多久执行一次轮播
  PageController pageController = PageController(
      initialPage: 0, keepPage: true, viewportFraction: 1.0); // 控制器
  late Timer mTimer;
  int position = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      pageController.animateToPage((position + 1) % widget.list.length,
          // 这个参数的作用：每切换一张轮播图时，这个切换的过程（动画）的秩序时间；
          duration: Durations.short4,
          // curve这个参数的作用：指定 这个切换的过程（动画）的动画类型
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("BannerStack--->build(BuildContext context)");
    return Stack(
      children: [
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: PageView.builder(
              itemCount: widget.itemCount,
              allowImplicitScrolling: true,
              controller: pageController,
              onPageChanged: (index) {
                // 这个方法的作用：更新方法里面的数据之后，还会将对应的数据更新到 UI。
                setState(() {
                  // 所以，这里一定要在 setState()方法里面完成赋值，在其他地方操作这一步，失效；
                  position = index;
                });
              },
              // 这里的 index 取值是 0~~10000；
              itemBuilder: (context, index) {
                return widget.list[index % widget.list.length];
              }),
        ),
        Positioned(
          // 这里是添加 Indicator指示器
          left: 0,
          // 这里 left 和 right 都设置为0，再配合 Row的 mainAxisAlignment 属性，指示器就可以居中了；
          right: 0,
          bottom: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // 这里可以直接使用 mRowList
            // children: mRowList,
            // 还可以这样实现：循环生成 list.length 个 Text 对象；
            children: List.generate(widget.list.length, (index) {
              return Container(
                width: 10,
                height: 10,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 3),
                decoration: BoxDecoration(
                  // 这里需要对position 做取余处理；类似Android的 adapter 中position的操作；
                  // 否则，position大小超过 list.length 之后，指示器颜色根据选中位置的变化，就不再生效；
                  // 这个取模操作，既可以在下面的位置完成，也可以在上面的 setState()方法完成；
                  color: (position % widget.list.length) == index
                      ? Colors.white
                      : Colors.grey,
                  // shape 或者下面的 borderRadius 实现方式，都可以创建一个原点。
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(5),//指示器显示为原点
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 必须执行销毁的操作，否则会造成内存泄漏；
    mTimer.cancel();
    pageController.dispose();
  }
}
