import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text("学习Flutter平台下的图片加载方式"),),
          // 图片默认居中
          // body: const MyImage(),// 矩形框图效果
          // body: const ContainerCyclerImage(),// 圆形框图效果
          // body: const ClipOvalCyclerImage(),// 圆形框图效果
          // body: const CircleAvatarCyclerIMage(),// 圆形框图效果
          body: const LoadLocalImage(),// 加载本地图片
        ),
      )
  );
}

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 600,
        height: 500,
        decoration:const BoxDecoration(
          color: Colors.green
        ),
        child: Image.network(
            "https://img1.baidu.com/it/u=2205810988,4283060315&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500",
          // fit: BoxFit.fill,
          fit: BoxFit.fitWidth,
          repeat: ImageRepeat.repeatX,
          alignment: Alignment.topLeft,
        ),
      ),
    );
  }
}

// 上面的方式加载出来的图片都是方形的（长和宽），我们可以有多重方式实现加载出来的图片是圆形的效果，比如：
// Container 实现圆形图片效果：
class ContainerCyclerImage extends StatelessWidget {
  const ContainerCyclerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.purple,
          // borderRadius: BorderRadius.all(200 as Radius)
          borderRadius: BorderRadius.circular(200),// 当宽高相等，且半径是宽/高的一半时，就成为了圆形。
          border: Border.all(
            color: Colors.blueGrey,
            width: 5,
            style: BorderStyle.solid,
          ),
          image: const DecorationImage(
              image: NetworkImage(
                  "https://img0.baidu.com/it/u=2123036823,827931345&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800"
              ),
            fit: BoxFit.fill
          )
        ),
      ),
    );
  }
}

// ClipOval 实现圆形图片效果；
class ClipOvalCyclerImage extends StatelessWidget{
  const ClipOvalCyclerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        clipBehavior: Clip.antiAlias,
        child: Image.network(
            "https://img2.baidu.com/it/u=1898128106,2722598876&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
          width: 500,
          height: 500,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

// CircleAvatar 实现圆形图片效果；
class CircleAvatarCyclerIMage extends StatelessWidget{
  const CircleAvatarCyclerIMage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      // radius: 250,
      // 下面这两个参数不能与 radius 同时使用
      maxRadius: 360,
      minRadius: 200,
      backgroundImage: NetworkImage(
        "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
      ),
    );
  }
}

class LoadLocalImage extends StatelessWidget{
  const LoadLocalImage({super.key});

  @override
  Widget build(BuildContext context) {
    // return ClipOval(
    //   child: Image.asset(
    //     //  # 下面注意 “-” 和  images 之间的空格，这个绝对不能少
    //     "images/3.0x/3xp.jpg",
    //     width: 600,
    //     height: 600,
    //     fit: BoxFit.cover,
    //   ),
    // );
    //// 这就是方形的图片加载
    return SizedBox(
      width: 600,
      height: 600,
      child: Image.asset("images/3.0x/px.jpg"),
    );
  }
}






