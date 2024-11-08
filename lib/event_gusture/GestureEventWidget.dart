import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Text("GestureDetector的各种手势，诸如：单机，双击，长按，垂直/水平移动"),
      onTap: () => {print("GestureDetectorListener: onTap()")},
      onTapDown: (TapDownDetails details) => {
        print("GestureDetectorListener:"
            "onTapDown().localPosition.distance：${details.globalPosition.distance}, "
            "onTapDown().globalPosition.distance：${details.globalPosition.distance}")
      },
      onTapUp: (TapUpDetails details) => {
        print("GestureDetectorListener:"
            "onTapUp().localPosition.distance：${details.localPosition.distance}, "
            "onTapUp().globalPosition.distance：${details.globalPosition.distance}")
      },
      onTapCancel: () => {},
      onDoubleTap: () => {print("GestureDetectorListener: onDoubleTap()")},
      onDoubleTapCancel: () => {},
      onDoubleTapDown: (TapDownDetails details) => {},
      onForcePressEnd: (ForcePressDetails details) => {},
      onForcePressPeak: (ForcePressDetails details) => {},
      onForcePressStart: (ForcePressDetails details) => {},
      onForcePressUpdate: (ForcePressDetails details) => {},
      //// TODO: onHorizontalDragxxx 和 onVerticalDragxxx 事件不能同时出现
      // onHorizontalDragCancel: ()=>{
      //
      // },
      // onHorizontalDragDown: (DragDownDetails details)=>{
      //
      // },
      // onHorizontalDragEnd: (DragEndDetails details)=>{
      //
      // },
      // onHorizontalDragStart: (DragStartDetails details)=>{
      //
      // },
      // onHorizontalDragUpdate: (DragUpdateDetails details)=>{
      //
      // },
      //// TODO：执行 onLongPress()时，onTapDown()也会被执行，这点要特别注意。
      onLongPress: () => {print("GestureDetectorListener: onLongPress()")},
      onLongPressCancel: () => {},
      onLongPressDown: (LongPressDownDetails details) => {},
      onLongPressEnd: (LongPressEndDetails details) => {},
      onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) => {},
      onLongPressStart: (LongPressStartDetails detail) => {},
      onLongPressUp: () => {print("GestureDetectorListener: onLongPressUp()")},
      onVerticalDragDown: (DragDownDetails details) => {},
      onVerticalDragEnd: (DragEndDetails details) => {},
      onVerticalDragStart: (DragStartDetails details) => {},
      onVerticalDragUpdate: (DragUpdateDetails details) => {},
      onVerticalDragCancel: () => {},
      onPanDown: (DragDownDetails details) => {},
      onPanEnd: (DragEndDetails details) => {},
      onPanStart: (DragStartDetails details) => {},
      onPanUpdate: (DragUpdateDetails details) => {},
      onPanCancel: () => {},
      // onScaleStart: (ScaleStartDetails details)=>{
      //
      // },
      // onScaleEnd: (ScaleEndDetails details)=>{
      //
      // },
      // onScaleUpdate: (ScaleUpdateDetails details)=>{
      //   print("GestureDetectorListener:"
      //       "onScaleUpdate().focalPoint.distance：${details.focalPoint.distance}, "
      //       "onScaleUpdate().focalPointDelta.distance：${details.focalPointDelta.distance}, "
      //       "onScaleUpdate().horizontalScale.sign：${details.horizontalScale.sign},"
      //       "${details.pointerCount}"
      //   )
      // },
    );
  }

  void setEventState() {
    setState(() {});
  }
}
