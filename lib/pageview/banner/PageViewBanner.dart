import 'package:flutter/material.dart';
import 'package:learnflutterdemo/pageview/banner/BannerListWidget.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "banner轮播图",
      home: PageViewBanner(),
    )
  );
}

class PageViewBanner extends StatefulWidget {
  const PageViewBanner({super.key});

  @override
  State<PageViewBanner> createState() {
    return PageViewBannerImpl();
  }
}

class PageViewBannerImpl extends State<PageViewBanner> {

  List<Widget> list = [];
  int itemCount = 10000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      BannerListWidget(
        srcLink: "https://t7.baidu.com/it/u=3152551887,2995429094&fm=193&f=GIF",
      ),
      BannerListWidget(
          srcLink: "https://t7.baidu.com/it/u=1342126990,4220169148&fm=193&f=GIF"
      ),
      BannerListWidget(
        srcLink: "https://t7.baidu.com/it/u=2333340137,3849757644&fm=193&f=GIF",
      ),
      BannerListWidget(
        srcLink: "https://t7.baidu.com/it/u=3525281990,3029291409&fm=193&f=GIF",
      ),
      BannerListWidget(
        srcLink: "https://t7.baidu.com/it/u=1638870152,178016082&fm=193&f=GIF",
      ),
      BannerListWidget(
        srcLink: "https://t7.baidu.com/it/u=287504871,271668269&fm=193&f=GIF",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text(
         "banner轮播图",
         style: TextStyle(
           fontSize: 24,
           color: Colors.deepPurple,
           fontStyle: FontStyle.italic,
         ),
       ),
       backgroundColor: Colors.blue,
     ),
     body: SizedBox(
       width: double.infinity,
       height: 240,
       child: PageView.builder(
         itemCount: itemCount,
         allowImplicitScrolling: true,
         // 这里的 index 取值是 0~~10000；
         itemBuilder: (context, index){
          return list[index % list.length];
        }
       ),
     ),
   );
  }
}

