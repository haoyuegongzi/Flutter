import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learnflutterdemo/pageview/autobanner/BannerStack.dart';
import 'package:learnflutterdemo/pageview/banner/BannerListWidget.dart';
import 'package:learnflutterdemo/pageview/cachepageview/KeepAliveWrapper.dart';

main() {
  runApp(const MaterialApp(
    title: "缓存PageView",
    debugShowCheckedModeBanner: true,
    home: CachePageView(),
  ));
}

class CachePageView extends StatefulWidget {
  const CachePageView({super.key});

  @override
  State<CachePageView> createState() {
    return PageViewBannerImpl();
  }
}

class PageViewBannerImpl extends State<CachePageView> {
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
    // 对象缓存的使用，需要注意场景；当数据量大，或者 数据需要实时更新的场景下，我们就不适宜 缓存数据；
    //      否则数据持续累积在内存中，会消耗恐怖的资源，造成界面丢帧、卡顿；
    // 当数据量小，也没有实时需要更新的必要，或者数据固定的情况下，我们可以考虑数据缓存；
    for (int i = 0; i < srcList.length; i++) {
      // 采用缓存机制之后（keepAlive = true）：
      //      在应用启动进入轮播界面时，会 多次执行 KeepAliveWrapper 和 BannerStack 的 build(BuildContext context) 方法；
      //      然后在第一轮 从第一张执行到最后一张时，会先执行 KeepAliveWrapper 的 build(BuildContext context) 方法，
      //                                    然后执行 BannerStack 的 build(BuildContext context) 方法；
      //      紧接着，从第二轮执行轮播开始，就只会执行  BannerStack 的 build(BuildContext context) 方法；
      //                                不再执行 KeepAliveWrapper 的 build(BuildContext context) 方法；
      //      而且，即便是当banner轮播图从最后一张切换到第一张时，也只会执行 BannerStack 的 build(BuildContext context) 方法；
      //                                            这应就大大的节省了时间和资源消耗；
      // keepAlive = false时，跟下面的 BannerListWidget（没有采用缓存机制）的逻辑是一样的。
      var banner = KeepAliveWrapper(
        keepAlive: true,
        child: Image.network(srcList[i], fit: BoxFit.cover,),
      );
      // 无论什么情况下，都会一直执行 BannerListWidget 和 BannerStack 的 build(BuildContext context) 方法；
      // 而且，当banner轮播图从最后一张切换到第一张时，会多次多次执行 BannerListWidget 和 BannerStack 的 build(BuildContext context) 方法；
      // var banner = BannerListWidget(srcLink: srcList[i]);
      list.add(banner);
    }
  }

  // 每次滑动的时候都会触发 build方法，这很消耗资源的；在cachePageview中，我们会学习如何缓存，类似 Android 的 Glide 的缓存工具；
  @override
  Widget build(BuildContext context) {
    print("CachePageView--->build(BuildContext context)");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "具有缓存功能的自动播放的banner轮播图",
          style: TextStyle(
            fontSize: 16,
            color: Colors.deepPurple,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: BannerStack(
        list: list,
        width: double.infinity,
        height: 320,
        itemCount: itemCount,
      ),
    );
  }
}
