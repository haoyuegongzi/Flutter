import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learnflutterdemo/pageview/autobanner/BannerStack.dart';
import 'package:learnflutterdemo/pageview/banner/BannerListWidget.dart';
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "自动播放的banner轮播图",
      home: AutoBannerWithIndicator(),
    )
  );
}

class AutoBannerWithIndicator extends StatefulWidget {
  const AutoBannerWithIndicator({super.key});

  @override
  State<AutoBannerWithIndicator> createState() {
    return PageViewBannerImpl();
  }
}

class PageViewBannerImpl extends State<AutoBannerWithIndicator> {
  List<Widget> list = [];
  List<String> srcList = [
    "https://t7.baidu.com/it/u=3152551887,2995429094&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=1342126990,4220169148&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=2333340137,3849757644&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=3525281990,3029291409&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=1638870152,178016082&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=287504871,271668269&fm=193&f=GIF",
  ];
  int itemCount = 10000;
  int position = 0;


  @override
  void initState() {
    super.initState();
    for(int i = 0; i < srcList.length; i++) {
      var banner = BannerListWidget(srcLink: srcList[i]);
      list.add(banner);
    }
  }

  // 每次滑动的时候都会触发 build方法，这很消耗资源的；在cachePageview中，我们会学习如何缓存，类似 Android 的 Glide 的缓存工具；
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text(
         "自动播放的banner轮播图",
         style: TextStyle(
           fontSize: 24,
           color: Colors.deepPurple,
           fontStyle: FontStyle.italic,
         ),
       ),
       backgroundColor: Colors.blue,
     ),
     body: BannerStack(list: list, width: double.infinity, height: 320, itemCount: itemCount,),
   );
  }
}

