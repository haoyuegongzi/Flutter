import 'package:flutter/material.dart';

// 自定义 Drawer 抽屉布局，无论是左侧，还是右侧，还是抽屉布局的header头部
// UserAccountsDrawerHeader: 是Flutter系统提供的已经定义好的 抽屉布局的header。
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter的抽屉布局",
          style: TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: const DrawerHeaderWidget(),
      // 左侧抽屉 / 弹窗，Drawer里面可以放 单个 widget(View)，也可以是具有 容器性质的 Container(VIewGroup)
      drawer: Drawer(
        // child: Text("左侧的侧边栏——抽屉布局"),
        child: ListView(
          children: [
            Image.network(
                "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
            const Divider(),
            Image.network(
                "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
            const Divider(),
            Image.network(
                "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
          ],
        ),
      ),
      // 右侧抽屉 / 弹窗，Drawer里面可以放 单个 widget(View)，也可以是具有 容器性质的 Container(VIewGroup)
      endDrawer: const Drawer(
        // child: Text("右侧侧边栏——抽屉布局"),
        child: Column(
          children: [
            // 给抽屉布局 Drawer 增加一个头部，这个头部，可以是 单个 widget(View)，也可以是具有 容器性质的 Container(VIewGroup)
            // DrawerHeader里面，既可以是单纯的一个 文本widget(View)， 也可以是一个 图片widget
            DrawerHeader(
                // 给抽屉布局的 背景  加一个颜色
                decoration: BoxDecoration(
                    // color: Colors.blueGrey,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
                        fit: BoxFit.cover)),
                // 在这里的 child 对象里面，我们可以继续实现更复杂的布局。
                child: Text("这个文本类型的 DrawerHeader 是怎么样的？")),
            Icon(
              Icons.account_balance,
              color: Colors.black26,
            ),
            Divider(),
            Icon(
              Icons.add_chart,
              color: Colors.black26,
            ),
            Divider(),
            Icon(
              Icons.add_alarm_sharp,
              color: Colors.black26,
            )
          ],
        ),
      ),
      // 可以理解为类似RecycleView的 footer，可以是 单个 widget(View)，也可以是具有 容器性质的 Container(VIewGroup)
      bottomSheet: const Text("bottomSheet是个什么鬼"),
    ),
  ));
}

class DrawerHeaderWidget extends StatefulWidget {
  const DrawerHeaderWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return DrawerWidgetHeader();
  }
}

class DrawerWidgetHeader extends State<DrawerHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text("这个布局的body部分");
  }
}
