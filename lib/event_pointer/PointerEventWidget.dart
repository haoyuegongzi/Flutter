
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learnflutterdemo/WrapWidget/demo1CustomWidget.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
  PointerEvent pointerEvent = const PointerDownEvent();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        setEventState(event);
      },
      onPointerMove: (PointerMoveEvent event) {
        setEventState(event);
      },
      onPointerCancel: (PointerCancelEvent event) {
        setEventState(event);
      },
      onPointerUp:  (PointerUpEvent event) {
        setEventState(event);
      },
      onPointerPanZoomEnd: (PointerPanZoomEndEvent event) {
        setEventState(event);
      },
      onPointerPanZoomStart: (PointerPanZoomStartEvent event) {
        setEventState(event);
      },
      onPointerPanZoomUpdate: (PointerPanZoomUpdateEvent event) {
        setEventState(event);
      },
      onPointerSignal: (PointerSignalEvent event) {
        setEventState(event);
      },
      child: Container(
        width: double.infinity,
        // height: double.infinity,
        // alignment: Alignment.center,
        // padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
        color: Colors.blueGrey,
        margin: const EdgeInsetsDirectional.all(4),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(
                "这个布局的body部分："
                    "Event事件的size值是：${pointerEvent.size}, \n"
                    "Event事件的distance值是：${pointerEvent.distance}, \n"
                    "Event事件的distanceMax值是：${pointerEvent.distanceMax}, \n"
                    "Event事件的distanceMin值是：${pointerEvent.distanceMin}, \n"
                    "Event事件的localDelta.distance值是：${pointerEvent.localDelta.distance}, \n"
                    "Event事件的delta.distance值是：${pointerEvent.delta.distance}, \n"
                    "Event事件的localPosition.distance值是：${pointerEvent.localPosition.distance}, \n"
                    "Event事件的 position.distance 值是：${pointerEvent.position.distance}, \n"
                    "Event事件的 pressure 值是：${pointerEvent.pressure}, \n"
                    "Event事件的 pressureMax 值是：${pointerEvent.pressureMax}, \n"
                    "Event事件的 pressureMin 值是：${pointerEvent.pressureMin}, \n"
                    "Event事件的 radiusMajor 值是：${pointerEvent.radiusMajor}, \n"
                    "Event事件的 radiusMax 值是：${pointerEvent.radiusMax}, \n"
                    "Event事件的 radiusMin 值是：${pointerEvent.radiusMin}, \n"
                    "Event事件的 radiusMinor 值是：${pointerEvent.radiusMinor}, \n"
            ),
            IgnorePointer(
              child: Listener(
                child: OutlinedButton(onPressed: (){
                  setState(() {
                    print(
                        "Event事件的 size值是：${pointerEvent.size}, \n"
                            "Event事件的 distance值是：${pointerEvent.distance}, \n"
                            "Event事件的 distanceMax值是：${pointerEvent.distanceMax}, \n"
                            "Event事件的 distanceMin值是：${pointerEvent.distanceMin}, \n"
                            "Event事件的 localDelta.distance值是：${pointerEvent.localDelta.distance}, \n"
                            "Event事件的 delta.distance值是：${pointerEvent.delta.distance}, \n"
                            "Event事件的 localPosition.distance值是：${pointerEvent.localPosition.distance}, \n"
                            "Event事件的 position.distance 值是：${pointerEvent.position.distance}, \n"
                            "Event事件的 pressure 值是：${pointerEvent.pressure}, \n"
                            "Event事件的 pressureMax 值是：${pointerEvent.pressureMax}, \n"
                            "Event事件的 pressureMin 值是：${pointerEvent.pressureMin}, \n"
                            "Event事件的 radiusMajor 值是：${pointerEvent.radiusMajor}, \n"
                            "Event事件的 radiusMax 值是：${pointerEvent.radiusMax}, \n"
                            "Event事件的 radiusMin 值是：${pointerEvent.radiusMin}, \n"
                            "Event事件的 radiusMinor 值是：${pointerEvent.radiusMinor}, \n"
                    );
                  });

                },
                    child: const Text("测试 IgnorePointer  忽略指针事件的效果")
                ),
              ),
            ),
            AbsorbPointer(
              child: Listener(
                child: OutlinedButton(onPressed: (){
                  print(
                      "Event事件的 size值是：${pointerEvent.size}, \n"
                          "Event事件的 distance值是：${pointerEvent.distance}, \n"
                          "Event事件的 distanceMax值是：${pointerEvent.distanceMax}, \n"
                          "Event事件的 distanceMin值是：${pointerEvent.distanceMin}, \n"
                          "Event事件的 localDelta.distance值是：${pointerEvent.localDelta.distance}, \n"
                          "Event事件的 delta.distance值是：${pointerEvent.delta.distance}, \n"
                          "Event事件的 localPosition.distance值是：${pointerEvent.localPosition.distance}, \n"
                          "Event事件的 position.distance 值是：${pointerEvent.position.distance}, \n"
                          "Event事件的 pressure 值是：${pointerEvent.pressure}, \n"
                          "Event事件的 pressureMax 值是：${pointerEvent.pressureMax}, \n"
                          "Event事件的 pressureMin 值是：${pointerEvent.pressureMin}, \n"
                          "Event事件的 radiusMajor 值是：${pointerEvent.radiusMajor}, \n"
                          "Event事件的 radiusMax 值是：${pointerEvent.radiusMax}, \n"
                          "Event事件的 radiusMin 值是：${pointerEvent.radiusMin}, \n"
                          "Event事件的 radiusMinor 值是：${pointerEvent.radiusMinor}, \n"
                  );
                },
                    child: const Text("测试 AbsorbPointer 忽略指针事件的效果")
                ),
              ),
            )
          ],
        )
      )
    );
  }

  void setEventState(PointerEvent event) {
    setState(() {
      pointerEvent = event;
    });
  }
}
