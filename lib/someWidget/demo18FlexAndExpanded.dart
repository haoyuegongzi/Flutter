import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Flutter的自适应宽/高度布局，类似Android LinearLayout的权重布局"),
      ),
      // body: const ExpandedView(),
      // body: const FlexWidget(),
      // body: const PartDifferentLayout(),
      body: const ComplexLayout(),
    ),
  ));
}

// Row / Column组件 + Expanded组件 + flex属性 来实现权重布局
class ExpandedView extends StatelessWidget {
  const ExpandedView({super.key});

  @override
  Widget build(BuildContext context) {
    const double sizeView = 40;
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black12,
        // margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          // 控制 每一行的 Item 相对于 父Widget 组件，在垂直方向的位置：顶对齐、垂直居中、底对齐
          // stretch 和 Center 好像是一样的。
          crossAxisAlignment: CrossAxisAlignment.center,
          // 布局开始方向是：从左往右，还是从右往左
          textDirection: TextDirection.ltr,
          // 控制 每一行的 Item 相对于 父Widget 组件 是 顶对齐、底对齐
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Expanded(
                // flex 属性就相当于 Android 线性布局里面的 weight权重布局 属性，有了这个属性之后，对应的 宽度/高度 就不生效了。
                // 因此，在这里，Row 组件里面的 组件，就不再设置 width参数了；设置了也没效果；
                // 如果将 Row组件 换成 Column组件，那么，就不再设置 height参数了；设置了也没效果；
                flex: 1,
                child: Container(
                    width: double.infinity,
                    // height: double.infinity,
                    color: Colors.brown,
                    child: const Icon(
                      Icons.cabin,
                      color: Colors.red,
                      size: sizeView,
                    ))),
            Expanded(
              flex: 2,
              child: Container(
                  width: double.infinity,
                  // height: double.infinity,
                  color: Colors.lime,
                  child: const Icon(
                    Icons.add_a_photo,
                    color: Colors.green,
                    size: sizeView,
                  )),
            ),
            Expanded(
                flex: 3,
                child: Container(
                    width: double.infinity,
                    // height: double.infinity,
                    color: Colors.lightGreen,
                    child: const Icon(Icons.ac_unit,
                        color: Colors.deepPurple, size: sizeView))),
          ],
        ));
  }
}

//  Flex组件 + direction属性 属性来实现权重布局
class FlexWidget extends StatelessWidget {
  const FlexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double sizeView = 50;
    // 相当于 Android的 LinearLayout线性布局 + weight权重属性。
    return Flex(
      // 这里 实现的布局效果，跟上面的 ExpandedView 实现是差不多的。不同的是：
      // ExpandedView里面是通过 Row / Column（行 / 列）组件 + Expanded组件 + flex属性 来实现的；
      // Flex Widget 里面是通过 Flex组件 + direction属性 属性来实现的，
      // direction属性有两个取值：horizontal 水平方向；vertical 垂直方向。相当于 ExpandedView里面的 Row / Column。
      // Flex组件 则相当于 ExpandedView里面的flex属性。
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
            // flex 属性就相当于 Android 线性布局里面的 weight权重布局 属性，有了这个属性之后，对应的 宽度/高度 就不生效了。
            // 因此，在这里，Row 组件里面的 组件，就不再设置 width参数了；设置了也没效果；
            // 如果将 Row组件 换成 Column组件，那么，就不再设置 height参数了；设置了也没效果；
            flex: 1,
            child: Container(
                // width: double.infinity,
                height: double.infinity,
                color: Colors.brown,
                child: const Icon(
                  Icons.cabin,
                  color: Colors.red,
                  size: sizeView,
                )
            )
        ),
        Expanded(
          flex: 2,
          child: Container(
              // width: double.infinity,
              height: double.infinity,
              color: Colors.lime,
              child: const Icon(
                Icons.add_a_photo,
                color: Colors.green,
                size: sizeView,
              )
          ),
        ),
        Expanded(
            flex: 3,
            child: Container(
                // width: double.infinity,
                height: double.infinity,
                color: Colors.lightGreen,
                child: const Icon(
                    Icons.ac_unit,
                    color: Colors.deepPurple,
                    size: sizeView
                )
            )
        )
      ],
    );
  }
}

// 某一个方向（horizontal 水平方向；vertical 垂直方向）后面的View组件 固定宽度，剩下的全部留给前面的布局
// 实现方式：后面 固定宽度的View组件，宽度直接写成一个固定的值，然后剩下的前面的宽度，按照 预期的比例，分配给剩余的布局；
// 比如，下面布局中，最后面的 Container组件宽度为520，然后剩下的宽度按照 1 : 2的比例，分配给两个 Expanded组件。
class PartDifferentLayout extends StatelessWidget {// 水平方向，右边的右边的布局固定，左边的自适应
  const PartDifferentLayout({super.key});

  @override
  Widget build(BuildContext context) {
    const double sizeView = 50;
    return Flex(
      // 这里 实现的布局效果，跟上面的 ExpandedView 实现是差不多的。不同的是：
      // ExpandedView里面是通过 Row / Column（行 / 列）组件 + Expanded组件 + flex属性 来实现的；
      // FlexWidget 里面是通过 Flex组件 + direction属性 属性来实现的，
      // direction属性有两个取值：horizontal 水平方向；vertical 垂直方向。相当于 ExpandedView里面的 Row / Column。
      // Flex组件 则相当于 ExpandedView里面的flex属性。
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          // flex 属性就相当于 Android 线性布局里面的 weight权重布局 属性，有了这个属性之后，对应的 宽度/高度 就不生效了。
          // 因此，在这里，Row 组件里面的 组件，就不再设置 width参数了；设置了也没效果；
          // 如果将 Row组件 换成 Column组件，那么，就不再设置 height参数了；设置了也没效果；
            flex: 1,
            child: Container(
              // width: double.infinity,
                height: double.infinity,
                color: Colors.brown,
                child: const Icon(
                  Icons.cabin,
                  color: Colors.red,
                  size: sizeView,
                )
            )
        ),
        Expanded(
          flex: 2,
          child: Container(
            // width: double.infinity,
              height: double.infinity,
              color: Colors.lime,
              child: const Icon(
                Icons.add_a_photo,
                color: Colors.green,
                size: sizeView,
              )
          ),
        ),
        Container(
          // width: 520,
          width: 120,
          height: double.infinity,
          color: Colors.lightBlueAccent,
          child: const Icon(
              Icons.ac_unit,
              color: Colors.deepPurple,
              size: sizeView
          ),
        )
      ],
    );
  }
}

// complex_layout 复杂布局：见 complex_layout.png
class ComplexLayout extends StatelessWidget {
  const ComplexLayout({super.key});

  @override
  Widget build(BuildContext context) {
    const double sizeView = 60;

    return Container(
      color: Colors.black12,
      // padding: const EdgeInsetsDirectional.all(12),
      margin: const EdgeInsetsDirectional.all(12),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.lightBlueAccent,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
              child: const Icon(
              Icons.ac_unit,
              color: Colors.deepPurple,
              size: sizeView,
              ),
            )
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.deepPurple,
                        margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                        child: const Icon(
                          Icons.add_a_photo,
                          color: Colors.green,
                          size: sizeView,
                        ),
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: Colors.orange,
                                    margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                                    child: const Icon(
                                      Icons.account_circle,
                                      color: Colors.black38,
                                      size: sizeView,
                                    )
                                )
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: Colors.teal,
                                    margin: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                    child: const Icon(
                                      Icons.account_balance,
                                      color: Colors.lime,
                                      size: sizeView,
                                    )
                                )
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            )
          )
        ],
      )
    );
  }
}