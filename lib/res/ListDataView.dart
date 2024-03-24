import 'package:flutter/material.dart';

// 在这里，ListDataView.dart这个类必须建在：/lib/res文件包 下面，然后再要使用的类里面通过
// “ ./res/ListDataView.dart ” 的形式引入该类，如果我们直接将这个类建在 “ lib ” 文件包
// 下面，那么，我们通过 “ ./lib/ListDataView.dart ” 的形式引入该类时，会报错，找不到。

List<Map<String, String>> listDataMap = [
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
  for(var i = 0; i < listDataMap.length; i++) {
    temp.add(ListTile(
      leading: Image.network(
          "${listDataMap[i]["imageUrl"]}"
      ),
      title: Text(
          "${listDataMap[i]["title"]}"
      ),
      subtitle: Text(
          "${listDataMap[i]["ahthor"]}"
      ),
    )
    );
  }
  return temp;
}


