import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch:Colors.brown,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "学习ICON",
            ),
          ),
          // body: const MyIcon(),
            body: const MyCustomerIcon(),
        ),
      )
  );
}

// 下面使用Flutter系统自带的icon
// class MyIcon extends StatelessWidget {
//   const MyIcon({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//         child: Row(// Column: 列；Row: 行
//           // 一个 图标list，图标都是系统自带的。分别是：搜索图标，主页图标，分类图标，购物图标
//           children: [
//             Icon(Icons.search,
//                 color: Colors.red,
//                 size: 40
//             ),
//             SizedBox(
//                 height: 10
//             ),
//             Icon(
//                 Icons.home,
//               color: Colors.blue,
//               size: 40,
//             ),
//             SizedBox(
//                 height: 10
//             ),
//             Icon(
//                 Icons.category,
//               color: Colors.purple,
//               size: 40,
//             ),
//             SizedBox(
//                 height: 10
//             ),
//             Icon(
//                 Icons.shop,
//               color: Colors.cyan,
//               size: 40,
//             ),
//             SizedBox(
//                 height: 10
//             ),
//           ],
//         )
//     );
//   }
// }

// // 下面 我们开始自定义 icon
class MyCustomerIcon extends StatelessWidget {
  const MyCustomerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Row(// Column: 列；Row: 行
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(CustomerIcon.book,color: Colors.purple),
            Icon(CustomerIcon.wechat,color: Colors.green),
            // 下面，我们可以通过 Icons.xxxx 的形式去获取 各种icon。
            // Icon(
            //   Icons.ac_unit,
            //   color: Colors.teal,
            //   size: 32,
            // ),
            // Icon(
            //   Icons.access_time_filled_sharp,
            //   color: Colors.purple,
            //   size: 32,
            // )
          ],
        )
    );
  }
}

// 下面我们使用自定义的：另外，我们可以在 阿里巴巴 图标库里面的图标
// Icon 库 原型 来自于 https://www.iconfont.cn/ 阿里巴巴图标库。将要下载的icon 加入到 购物差，然后选择下载“源码”，
// 下载完成后，解压 压缩包，
// 然后再Flutter项目的根目录创建  “fonts”文件夹，然后将 上面解压的文件里面的 “iconfont.json” 和 “iconfont.ttf” 两个文件拷贝过来。
class CustomerIcon {
  // book 图标
  static const IconData book = IconData(
      0xe64f,// 这里的值，来自于 fonts文件夹下的 xxxx.json 的文件中 的 “unicode”字段。这里不能错，错了就找不到了
      fontFamily: 'CustomerIcon',// 这里的名称 与 pubspec.yaml 中配置的名称一致。
      matchTextDirection: true
  );
  // 微信图标
  static const IconData wechat = IconData(
      0xe6cd,// 这里的值，来自于 fonts文件夹下的 xxxx.json 的文件中 的 “unicode”字段。这里不能错，错了就找不到了
      fontFamily: 'CustomerIcon',
      matchTextDirection: true
  );
}





