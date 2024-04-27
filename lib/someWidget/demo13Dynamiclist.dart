import 'package:flutter/material.dart';
import '../res/ListDataView.dart';

main() {
  runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Flutter动态列表",
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
          body: DynamicListType4(),
        ),
      )
  );
}

// 动态列表 实现方式 1
class DynamiclistType1 extends StatelessWidget {
  const DynamiclistType1({super.key});

  List<Widget> widgetList() {
    List<Widget> list = [];
    for(var i = 0; i < 21; i++) {
      list.add(ListTile(
        title: Text(
            "这是列表的第 $i 个Item",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
            fontStyle: FontStyle.normal,
            color: Colors.deepPurple,
            backgroundColor: Colors.lime
          ),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: widgetList(),
    );
  }
}

// 动态列表 实现方式 2
class DynamicListType2 extends StatelessWidget {
  DynamicListType2({super.key}) {
    print(listData);
  }

  List<Map<String, String>> listData = [
    {
      "title":"Candy shop",
      "ahthor":"Mohamed Chain",
      "imageUrl":"https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
    },
    {
      "title":"Wladislawa",
      "ahthor":"Summer",
      "imageUrl":"https://www.pexels.com/zh-cn/photo/17126633/"
    },
    {
      "title":"女士、远足、湖图片",
      "ahthor":"Mohamed Chain",
      "imageUrl":"https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
    },
    {
      "title":"Ellwangen",
      "ahthor":"jameswheeler",
      "imageUrl":"https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
    },
    {
      "title":"哥特、幻想、黑暗",
      "ahthor":"darksouls1",
      "imageUrl":"https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
    },
  ];

  List<Widget> createWidgetList() {
    List<Widget> temp = [];
    for(var i = 0; i < listData.length; i++) {
      temp.add(ListTile(
          leading: Image.network(
              "${listData[i]["imageUrl"]}"
          ),
          title: Text(
              "${listData[i]["title"]}"
          ),
          subtitle: Text(
              "${listData[i]["ahthor"]}"
          ),
        )
      );
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    print(listData);
    return ListView(
      children: createWidgetList(),
    );
  }
}

// 动态列表 实现方式 3
class DynamicListType3 extends StatelessWidget {
  DynamicListType3({super.key}) {
    print(listData);
  }

  List<Map<String, String>> listData = [
    {
      "title":"Candy shop",
      "ahthor":"Mohamed Chain",
      "imageUrl":"https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
    },
    {
      "title":"Wladislawa",
      "ahthor":"Summer",
      "imageUrl":"https://www.pexels.com/zh-cn/photo/17126633/"
    },
    {
      "title":"女士、远足、湖图片",
      "ahthor":"Mohamed Chain",
      "imageUrl":"https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
    },
    {
      "title":"Ellwangen",
      "ahthor":"jameswheeler",
      "imageUrl":"https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
    },
    {
      "title":"哥特、幻想、黑暗",
      "ahthor":"darksouls1",
      "imageUrl":"https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
    },
  ];

  List<Widget> createList() {
    List<Widget> temp = [];
    for(var i = 0; i < listData.length; i++) {
      temp.add(ListTile(
        leading: Image.network(
            "${listData[i]["imageUrl"]}"
        ),
        title: Text(
            "${listData[i]["title"]}"
        ),
        subtitle: Text(
            "${listData[i]["ahthor"]}"
        ),
      )
      );
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    print(listData);
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
              "${listData[index]["title"]}",
          ),
          subtitle: Text(
            "${listData[index]["ahthor"]}"
          ),
          leading: Image.network("${listData[index]["imageUrl"]}"),
        );
      },
    );
  }
}

// 三种实现方式中，方式1 和 方式2，总体上差不多，都是基于数据列表创建  Widget 列表。
// 方式3 则是基于数据列表，通过 builder 的自主循环功能 去创建 Widget列表。


// 将数据写在 三方工具类里面，然后获取，类似Java中的utils工具类。
class DynamicListType4 extends StatelessWidget {
  DynamicListType4({super.key}) {
    print(listDataMap);
  }

  @override
  Widget build(BuildContext context) {
    print(listDataMap);
    return ListView.builder(
      // 这里，两个入参都非常重要，index 表示系统会顺着 index 位置去找数据并与 widget 组件绑定。
      // itemBuilder 则是负责 创建 Widget 控件。
      itemCount: listDataMap.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            "${listDataMap[index]["title"]}",
          ),
          subtitle: Text(
              "${listDataMap[index]["ahthor"]}"
          ),
          leading: Image.network("${listDataMap[index]["imageUrl"]}"),
        );
      },
    );
  }
}












