import 'package:flutter/material.dart';

// Column 的用法 跟Row  几乎完全一样，不同的是，Row是行，水平方向；Column是列，垂直方向。
//        二者的用法甚至参数方面，都几乎完全一致。

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
            "线性布局组件的 列 属性，相当于Android中的Ver方向",
          style: TextStyle(
            fontSize: 24,
            color: Colors.red,
            fontWeight: FontWeight.w400
          ),
        ),
      ),
      body: const ColumnView(),
    ),
  ));
}

class ColumnView extends StatelessWidget {
  const ColumnView({super.key});

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
      child: const Column(
        // mainAxisAlignment: 控制 水平方向  Item的位置布局关系；
        // MainAxisAlignment.spaceAround：将空闲宽度width 均匀地放置在子节点之间，
        //                   并将该空间的一半放置在第一个和最后一个子节点的前后（最后这句话的意思是：
        //                   第一个Item的前面占据每个Item所占空间的一半；最后一个Item的前面占据
        //                   每个Item的另一半。简单理解：相邻Item之间的间距是两边Item到边界的距离的2倍。
        //
        //  MainAxisAlignment.spaceBetween：在水平方向，第一个Item左对齐，最后一个右对齐，
        //                                  其他Item均分剩余的水平宽度。
        // MainAxisAlignment.spaceEvenly：在水平方向，均分 宽度width
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        // 控制 每一行的 Item 相对于 父Widget 组件，在垂直方向的位置：顶对齐、垂直居中、底对齐
        // stretch 和 Center 好像是一样的。
        crossAxisAlignment: CrossAxisAlignment.center,
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
