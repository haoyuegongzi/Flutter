import 'package:flutter/material.dart';
import 'package:learnflutterdemo/pageview/banner/BannerListWidget.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "banner轮播图",
      home: PageViewBanner(),
    )
  );
}

class PageViewBanner extends StatefulWidget {
  const PageViewBanner({super.key});

  // TODO:lifecycle: StatefulWidget 创建时被调用，用于创建与该 widget 关联的 State 对象。
  @override
  State<PageViewBanner> createState() {
    return PageViewBannerImpl();
  }
}

class PageViewBannerImpl extends State<PageViewBanner> {
  var listData = [1, 2, 3, 4, 5];
  List<Widget> list = [];
  List<Widget> newList = [];
  int itemCount = 10000;

  @override
  void initState() {
    // TODO:lifecycle: 生命周期中只会被调用一次，在 State 对象被插入到渲染树中时调用。进行一次性的初始化工作。
    super.initState();
    list = [
      BannerListWidget(
        srcLink: "https://t7.baidu.com/it/u=3152551887,2995429094&fm=193&f=GIF",
      ),
      BannerListWidget(
          srcLink: "https://t7.baidu.com/it/u=1342126990,4220169148&fm=193&f=GIF"
      ),
      BannerListWidget(
        srcLink: "https://t7.baidu.com/it/u=2333340137,3849757644&fm=193&f=GIF",
      ),
      BannerListWidget(
        srcLink: "https://t7.baidu.com/it/u=3525281990,3029291409&fm=193&f=GIF",
      ),
      BannerListWidget(
        srcLink: "https://t7.baidu.com/it/u=1638870152,178016082&fm=193&f=GIF",
      ),
      BannerListWidget(
        srcLink: "https://t7.baidu.com/it/u=287504871,271668269&fm=193&f=GIF",
      ),
    ];
  }

  @override
  void didChangeDependencies() {
    // TODO:lifecycle:在 initState 之后立即调用，并且每当 State 对象的依赖项发生变化时也会调用。可以用于处理依赖项变化的逻辑。
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO:lifecycle: 构建 widget 树的方法，每次需要更新界面时都会调用。
   return Scaffold(
     appBar: AppBar(
       title: const Text(
         "banner轮播图",
         style: TextStyle(
           fontSize: 24,
           color: Colors.deepPurple,
           fontStyle: FontStyle.italic,
         ),
       ),
       backgroundColor: Colors.blue,
     ),
     body: SizedBox(
       width: double.infinity,
       height: 240,
       child: PageView.builder(
         itemCount: itemCount,
         allowImplicitScrolling: true,
         // 这里的 index 取值是 0~~10000；
         itemBuilder: (context, index){
          return list[index % list.length];
        }
       ),
     ),
   );
  }

  @override
  void didUpdateWidget(covariant PageViewBanner oldWidget) {
    // TODO:lifecycle: 在 widget 重新构建时调用，这里的 oldWidget 是之前的 widget。适用于需要比较新旧 widget 数据的场景。
    super.didUpdateWidget(oldWidget);
  }

  @override
  void setState(VoidCallback fn) {
    // TODO:lifecycle: 通知 Flutter 框架该状态已经改变，并请求重建 widget 树。
    super.setState(fn);
  }

  @override
  void deactivate() {
    // TODO:lifecycle: 当 State 对象从树中移除时调用，但还没有被销毁。适用于需要做一些清理工作，但还不完全销毁的场景。
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO:lifecycle: 在 State 对象永久移除时调用，用于释放资源。例如取消计时器、流的订阅等。
    super.dispose();
  }
}

