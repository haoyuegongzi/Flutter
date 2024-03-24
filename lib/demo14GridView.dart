
import './res/ListDataView.dart';
import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Flutter Grid网格列表",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              color: Colors.purple,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              wordSpacing: 1.2,
              decorationColor: Colors.teal,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
        body: const GridViewBuilderAxisCount(),
      ),
    )
  );
}

class GridViewCount extends StatelessWidget {
  const GridViewCount({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,//控制列数，这个作用跟 RecyclerView 中的 SpanCount 一样
      crossAxisSpacing: 10,
      childAspectRatio: 2.5,
      children: <Widget>[
        // const Icon(Icons.home),
        // const Icon(Icons.ac_unit),
        // const Icon(Icons.search),
        // const Icon(Icons.settings),
        // const Icon(Icons.airport_shuttle),
        // const Icon(Icons.all_inclusive),
        // const Icon(Icons.beach_access),
        // const Icon(Icons.cake),
        // const Icon(Icons.circle),
        // const Icon(Icons.construction),
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
      ],
    );
  }
}

class GridViewaExtent extends StatelessWidget {
  const GridViewaExtent({super.key});

  List<Widget> listWidgetData() {
    var temtList = listDataMap.map((value){
      return Container(
        padding: const EdgeInsetsDirectional.all(25),
        margin: const EdgeInsetsDirectional.all(20),
        decoration: BoxDecoration(border: Border.all(
          color: Colors.blueGrey,
          width: 2
        )),
        child: Column(
          children: <Widget>[
            Image.network(value["imageUrl"]!),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            const Text(
              "这种方式生产Widget列表",
              style: TextStyle(
                color: Colors.red,
                fontSize: 24
              ),
            )
          ],
        ),
      );
    });
    return temtList.toList();
  }

  List<Widget> getListWidgetData() {
    var tempList=listDataMap.map((value){
      return Container(
        margin: const EdgeInsetsDirectional.all(15),
        decoration: BoxDecoration(
            border: Border.all(
                color:const Color.fromRGBO(233, 233,233, 0.9),
                width: 1
            )
        ),
        child:Column(
          children: <Widget>[
            Image.network(value["imageUrl"]!),
            const SizedBox(height: 12),
            Text(
              value["title"]!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20
              ),
            )
          ],
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 500, // 可以理解为控制 Item 的宽度，数值越大，Item宽度越宽
      mainAxisSpacing: 100,    // 可以理解为：控制 Item 在垂直方向的间距。取值为 0 时，Item 垂直方向挨在一起。
      crossAxisSpacing: 40,    // 可以理解为：控制 Item 在水平方向的间距。取值为 0 时，Item 水平方向挨在一起。
      // 可以理解为：Item 的宽高比例，可以理解为：Item的缩放比例。
      // 比如 w=500 & h=313 的图片，这个值越大，图片越小，但是图片并没有因为变小，而出现变形失真的情况。
      // 而在没有定义宽高的组件中，他默认是一个正方形。也就是 childAspectRatio 为1。然后根据该参数的变化，变成横向 或者 纵向 的长方形。
      childAspectRatio: 1,
      children: <Widget>[
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        Image.network(
            "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
      ],
    );
  }
}

class GridViewaExtent2 extends StatelessWidget {
  const GridViewaExtent2({super.key});

  List<Widget> listWidgetData() {
    var temtList = listDataMap.map((value){
      return Container(
        padding: const EdgeInsetsDirectional.all(25),
        margin: const EdgeInsetsDirectional.all(20),
        decoration: BoxDecoration(border: Border.all(
            color: Colors.blueGrey,
            width: 2
        )),
        child: Column(
          children: <Widget>[
            Image.network(value["imageUrl"]!),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            const Text(
              "这种方式生产Widget列表",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 24
              ),
            )
          ],
        ),
      );
    });
    return temtList.toList();
  }

  List<Widget> getListWidgetData() {
    var tempList=listDataMap.map((value){
      return Container(
        margin: const EdgeInsetsDirectional.all(15),
        decoration: BoxDecoration(
            border: Border.all(
                color:const Color.fromRGBO(233, 233,233, 0.9),
                width: 1
            )
        ),
        child:Column(
          children: <Widget>[
            Image.network(value["imageUrl"]!),
            const SizedBox(height: 12),
            Text(
              value["title"]!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20
              ),
            )
          ],
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      scrollDirection: Axis.vertical,
      maxCrossAxisExtent: 500, // 可以理解为控制 Item 的宽度，数值越大，Item宽度越宽
      mainAxisSpacing: 100,    // 可以理解为：控制 Item 在垂直方向的间距。取值为 0 时，Item 垂直方向挨在一起。
      crossAxisSpacing: 40,    // 可以理解为：控制 Item 在水平方向的间距。取值为 0 时，Item 水平方向挨在一起。
      // 可以理解为：Item 的宽高比例，可以理解为：Item的缩放比例。
      // 比如 w=500 & h=313 的图片，这个值越大，图片越小，但是图片并没有因为变小，而出现变形失真的情况。
      // 而在没有定义宽高的组件中，他默认是一个正方形。也就是 childAspectRatio 为1。然后根据该参数的变化，变成横向 或者 纵向 的长方形。
      childAspectRatio: 1,
      children: listWidgetData(),
    );
  }
}

//  GridView.builder + SliverGridDelegateWithFixedCrossAxisCount 的实现：
class GridViewBuilderAxisCount extends StatelessWidget {
  const GridViewBuilderAxisCount({super.key});

  Widget listWidgetData(context,  index) {
      return Container(
        padding: const EdgeInsetsDirectional.all(25),
        margin: const EdgeInsetsDirectional.all(20),
        decoration: BoxDecoration(border: Border.all(
            color: Colors.blueGrey,
            width: 2
        )),
        child: Column(
          children: <Widget>[
            Image.network(listDataMap[index]["imageUrl"]!),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            const Text(
              "这种方式生产Widget列表",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 24
              ),
            )
          ],
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listDataMap.length,
      // gridDelegate参数是 SliverGridDelegate 类型的，他是 abstract 抽象类。由他的两个子类：
      // SliverGridDelegateWithFixedCrossAxisCount 和 SliverGridDelegateWithMaxCrossAxisExtent 实现。
      // 二者的区别是：前者以“Count“結尾用于 GridView 的 count 功能；后者以”Extent“結尾用于 GridView 的 extent 功能
      // 该模式下，如果窗口/父组件（View)的宽度发生变化，Item的宽高比例也会发生变化
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 直接指定水平方向Item的数量
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1,
        // If null, childAspectRatio is used instead.
        mainAxisExtent: 500 // 指定Item的 宽度
      ),
      // itemBuilder: (BuildContext context, int index) {
      //   listWidgetData(context, index);
      // },
      // 上面 itemBuilder 的写法等价于下面的写法，运行效果完全一样
      itemBuilder: listWidgetData
    );
  }
}

//  GridView.builder + SliverGridDelegateWithFixedCrossAxisExtent 的实现：
class GridViewBuilderAxisExtent extends StatelessWidget {
  const GridViewBuilderAxisExtent({super.key});

  Widget listWidgetData(context,  index) {
    return Container(
        padding: const EdgeInsetsDirectional.all(25),
        margin: const EdgeInsetsDirectional.all(20),
        decoration: BoxDecoration(border: Border.all(
            color: Colors.blueGrey,
            width: 2
        )),
        child: Column(
          children: <Widget>[
            Image.network(listDataMap[index]["imageUrl"]!),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            const Text(
              "这种方式生产Widget列表",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 24
              ),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listDataMap.length,
        // gridDelegate参数是 SliverGridDelegate 类型的，他是 abstract 抽象类。由他的两个子类：
        // SliverGridDelegateWithFixedCrossAxisCount 和 SliverGridDelegateWithMaxCrossAxisExtent 实现。
        // 二者的区别是：前者以“Count“結尾用于 GridView 的 count 功能；后者以”Extent“結尾用于 GridView 的 extent 功能
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,// 水平方向 父组件（View）的长度，自动计算能放多少个Item
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
          childAspectRatio: 1
        ),
        itemBuilder: (BuildContext context, int index) {
          listWidgetData(context, index);
        },
        // 上面 itemBuilder 的写法等价于下面的写法，运行效果完全一样
        // itemBuilder: listWidgetData
    );
  }
}












