import 'package:flutter/material.dart';

// 线性布局组件：包括 Row（行） 和 Column（列），相当于 Android 中的 LinearLayout线性布局
// 的 Horizontal 属性 + Vertical 属性。因此， Row（行） 和 Column（列）组件，相当于 Android中 的 ViewGroup控件
main() {
  // 方式一、通过普通方法设置参数
  LinearLayoutRowDynamicParameter1 dynamicParameter1 =
      LinearLayoutRowDynamicParameter1();
  dynamicParameter1.setColor(Colors.red);
  dynamicParameter1.setIcon(Icons.account_box);

  // 方式二、通过构造方法设置参数
  LinearLayoutRowDynamicParameter2 dynamicParameter2 =
      LinearLayoutRowDynamicParameter2(Icons.contact_mail, Colors.deepPurple);
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Flutter的线性布局"),
      ),
      body: const CustomeRowLayout(),
    ),
  ));
}

// 水平方向，线性布局 + 静态参数
class LinearLayoutRowStaticParameter extends StatelessWidget {
  const LinearLayoutRowStaticParameter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      /// double.infinity 和double.maxFinite可以让当前元素的width或者height达到父元素的尺寸; 相当于 Android的 match_parent
      // double.nan: 取值为 0；
      // double.infinity: 1.0 / 0.0，亦即 正无穷大；
      // double.negativeInfinity: -infinity，亦即 负无穷小；
      // double.minPositive: 取值 5e-324，亦即 无穷小，无限趋近于 0；
      // double.maxFinite: 取值 1.7976931348623157e+308，正无穷大
      width: double.infinity,
      height: double.infinity,
      color: Colors.black12,
      margin: const EdgeInsets.all(25),
      // alignment: Alignment.topLeft,
      child: const Row(
        // mainAxisAlignment: 控制 水平方向  Item的位置布局关系；
        // MainAxisAlignment.spaceAround：将空闲宽度width 均匀地放置在子节点之间，
        //                   并将该空间的一半放置在第一个和最后一个子节点的前后（最后这句话的意思是：
        //                   第一个Item的前面占据每个Item所占空间的一半；最后一个Item的前面占据
        //                   每个Item的另一半。简单理解：相邻Item之间的间距是两边Item到边界的距离的2倍。
        //
        //  MainAxisAlignment.spaceBetween：在水平方向，第一个Item左对齐，最后一个右对齐，
        //                                  其他Item均分剩余的水平宽度。
        // MainAxisAlignment.spaceEvenly：在水平方向，均分 宽度width
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        // 控制 每一行的 Item 相对于 父Widget 组件，在垂直方向的位置：顶对齐、垂直居中、底对齐
        // stretch 和 Center 好像是一样的。
        crossAxisAlignment: CrossAxisAlignment.end,
        // 布局开始方向是：从左往右，还是从右往左
        textDirection: TextDirection.rtl,
        // 控制 每一行的 Item 相对于 父Widget 组件 是 顶对齐、底对齐
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.all(25),
            child: Icon(
              Icons.cabin,
              color: Colors.red,
              size: 40,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.all(25),
            child: Icon(
              Icons.add_a_photo,
              color: Colors.green,
              size: 40,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.all(25),
            child: Icon(
              Icons.ac_unit,
              color: Colors.blue,
              size: 40,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.all(25),
            child: Icon(
              Icons.account_circle,
              color: Colors.yellow,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

// 水平方向，线性布局 + 动态入参：动态入参的时候，注意以下两点：
// 1、构造方法的前面不能出现 const 关键字；
// 2、被定义出来通过传参的方式赋值的变量前面，需要加 late 关键字修饰；
class LinearLayoutRowDynamicParameter1 extends StatelessWidget {
  // 关于动态入参，这个跟Java类似，我们需要什么参数通过外部设置进来，我们就可以在这个类的内部创建
  // 对应的变量，在指定的方法里面，或者构造方法里面去接收。
  LinearLayoutRowDynamicParameter1({super.key});

  late IconData iconData;
  late Color colors;

  void setIcon(IconData icon) {
    iconData = icon;
  }

  void setColor(Color color) {
    colors = color;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(25),
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: colors,
            size: 40,
          )
        ],
      ),
    );
  }
}

// 注意 动态入参 和 构造入参 两种实现方式 的构造方法的不同。

// 水平方向，线性布局 + 构造入参：构造入参的方式传参时， 构造函数的前面 不需要加 const 关键字；
class LinearLayoutRowDynamicParameter2 extends StatelessWidget {
  IconData iconData;
  Color colors;

  // 关于动态入参，这个跟Java类似，我们需要什么参数通过外部设置进来，我们就可以在这个类的内部创建
  // 对应的变量，在指定的方法里面，或者构造方法里面去接收。
  LinearLayoutRowDynamicParameter2(this.iconData, this.colors, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(25),
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: colors,
            size: 40,
          )
        ],
      ),
    );
  }
}

// 水平方向，线性布局 + 构造入参
// class LinearLayoutRowDynamicParameter3 extends StatelessWidget {
//   late IconData iconData;
//   late Color colors;
//
//   // 关于动态入参，这个跟Java类似，我们需要什么参数通过外部设置进来，我们就可以在这个类的内部创建
//   // 对应的变量，在指定的方法里面，或者构造方法里面去接收。
//   LinearLayoutRowDynamicParameter3({super.key});
//
//   void setIcon(IconData icon) {
//     iconData = icon;
//   }
//
//   void setColor(Color color) {
//     colors = color;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsetsDirectional.all(25),
//       child: Row(
//         children: <Widget>[
//           Icon(
//             iconData,
//             color: colors,
//             size: 40,
//           )
//         ],
//       ),
//     );
//   }
// }

class CustomeRowLayout extends StatelessWidget {
  const CustomeRowLayout({super.key});

  static double viewSize = 25;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // 这里实现 一个 List<Widget> children；
      children: <Widget>[
        MyContainer(
            Colors.black, Icons.account_circle, Colors.redAccent, viewSize),
        MyContainer(
            Colors.deepPurple, Icons.add_a_photo, Colors.brown, viewSize),
        MyContainer(
            Colors.lime, Icons.access_time, Colors.indigoAccent, viewSize),
        MyContainer(
            Colors.green, Icons.account_balance, Colors.lightGreen, viewSize),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  IconData iconData;
  Color viewColor, parentColor;
  double viewSize;

  MyContainer(
      this.viewColor,
      this.iconData,
      this.parentColor,
      this.viewSize,
      {super.key}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(25),
      margin: const EdgeInsetsDirectional.all(15),
      color: parentColor,
      child: Icon(
        iconData,
        color: viewColor,
        size: viewSize,
      ),
    );
  }
}
