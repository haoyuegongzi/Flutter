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
  int position = 0;

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
     body: Stack(
       children: [
         SizedBox(
           width: double.infinity,
           height: 240,
           child: PageView.builder(
               itemCount: itemCount,
               allowImplicitScrolling: true,
               onPageChanged: (index){
                 setState(() {
                   // 这里一定要在 setState()方法里面完成赋值，在其他地方操作这一步，失效；
                   position = index;
                 });
               },
               // 这里的 index 取值是 0~~10000；
               itemBuilder: (context, index){
                 return list[index % list.length];
               }
           ),
         ),
         Positioned(
           left: 0,// 这里 left 和 right 都设置为0，再配合 Row的 mainAxisAlignment 属性，指示器就可以居中了；
           right: 0,
           bottom: 2,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
              // 这里可以直接使用 mRowList
             // children: mRowList,
             // 还可以这样实现：循环生成 list.length 个 Text 对象；
             children: List.generate(list.length, (index){
               return Container(
                 width: 10,
                 height: 10,
                 margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 3),
                 decoration: BoxDecoration(
                   // 这里需要对position 做取余处理；类似Android的 adapter 中position的操作；
                   // 否则，position大小超过 list.length 之后，指示器颜色根据选中位置的变化，就不再生效；
                   // 这个取模操作，既可以在下面的位置完成，也可以在上面的 setState()方法完成；
                   color: (position % list.length) ==  index ? Colors.white : Colors.grey,
                   shape: BoxShape.circle,// shape 或者下面的 borderRadius 实现方式，都可以创建一个原点。
                   // borderRadius: BorderRadius.circular(5),//指示器显示为原点
                 ),
               );
             }).toList(),
           ),
         )
       ],
     ),
   );
  }
}

