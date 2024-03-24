import 'package:flutter/material.dart';

// 在Android中，给某一个组件 添加一个与周边组件一定间距的需求，我们通常有以下几种实现方式：
// 1、给 该组件添加 margin 属性，直接在空间布局上，就让 该组件与其他组件，包括父组件 保持一个距离；
// 2、给该组件添加 padding 属性，让该组件内部的内容 距离该组件 的边界  保持一个距离。
// 上面的这两中实现方式，可以对应着不同的需求场景。这两种方式在Flutter里面，同样适用。
// 但是，在Flutter中，不是所有的组件都包含着 margin 和 padding 两个属性，
// 或者说 margin 和 padding 两个属性 同时生效。
// 但是 Flutter 特别给我们提供了一个名为 padding 的组件，来实现这应的需求。
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Flutter 的一个简单Text"),
      ),
      body: const PaddingWidgetMarginPading(),
    ),
  ));
}

// 简单的 margin 和 padding 属性 实现 间距：
class SimpleMarginAndPaddingAttr extends StatelessWidget {
  const SimpleMarginAndPaddingAttr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      /* EdgeInsetsDirectional 和 EdgeInsets 都是 EdgeInsetsGeometry 的子类 */
      margin: const EdgeInsetsDirectional.all(15),
      // 这里的padding属性，在没有child Widget 时，是不生效的。
      padding: const EdgeInsets.all(15),
      child: const Text(
        "通过 margin 和 padding 两个属性来实现 间距需求",
      ),
    );
  }
}

// 通过 Padding Widget 这个组件来实现内间距。
class PaddingWidget extends StatelessWidget {
  const PaddingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Padding Widget控件中，必须要有设置 padding 这个属性当属性值 为 0 时，Padding Widget控件中
    // 的内容与 他的父Widget组件之间没有间距（没有内间距）。此时没办法使用 margin 属性来设置外边距
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        "通过 Pading Widget 这个组件来实现 内间距",
        style: TextStyle(
            color: Colors.lime,
            backgroundColor: Colors.black54
        ),
      ),
    );
  }
}

// PaddingWidget组件+margin属性+padding属性实现的一个Widget
class PaddingWidgetMarginPading extends StatelessWidget {
  const PaddingWidgetMarginPading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsetsDirectional.all(15),
      // 上面的 margin 属性是 Container Widget组件相对于其 父组件 Scaffold Widget 之间的（外）间距。
      // 上面的 padding 属性是 Container Widget组件相对于其 子组件 Padding Widget 之间的（内）间距
      color: Colors.blue,
      child: const Padding(
        // 这里的 padding 属性是 Padding Widget组件相对于其 内部 内容 的内间距。
        // 在内间距实现 方面，Padding Widget组件 所占用的内存远比 Container Widget组件要小，
        // 因此在实现单纯的 padding内间距需求时，首推 Padding Widget组件。
        padding: EdgeInsets.all(15),
        child: Text(
          "这里是通过 PaddingWidget组件+margin属性+padding属性实现的一个Widget",
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.orange
          ),
        ),
      ),
    );
  }

}



















































